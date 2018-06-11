#!/bin/bash

#Function to convert each Octet to Binary
function convip()
{
	BI=({0..1}{0..1}{0..1}{0..1}{0..1}{0..1}{0..1}{0..1})
	octet=${BI[${1}]}
	echo ${octet}
}

#Function to divide subnet into smaller subnet
function divideSubnet()
{
	_BINARY=$1
	_CIDR=$2
	_DIVIDER=$3
	_NETWORK_BINARY=${_BINARY:0:${_CIDR}}
	_ADDRESS_BINARY=`echo ${_BINARY:${_CIDR}} | tr "1" "0"`
	_COUNT=0

	#If divider = 1, no further split, print current subnet
	if [ ${_DIVIDER} -eq 1 ]
	then
		echo -e `printSubnet ${_BINARY} ${_CIDR}`
	else 
		# split into 2 subnet 
		_SUBNET1=${_BINARY:0:${_CIDR}}"0"${_ADDRESS_BINARY:1}
		_SUBNET2=${_BINARY:0:${_CIDR}}"1"${_ADDRESS_BINARY:1}
		# If divider = 2, print the above 2 subnet
		if [ ${_DIVIDER} -eq 2 ]
		then
			#echo -e "$((2#${_SUBNET1:0:8})).$((2#${_SUBNET1:8:8})).$((2#${_SUBNET1:16:8})).$((2#${_SUBNET1:24}))/$((${_CIDR} + 1))\n"
			#echo -e "$((2#${_SUBNET2:0:8})).$((2#${_SUBNET2:8:8})).$((2#${_SUBNET2:16:8})).$((2#${_SUBNET2:24}))/$((${_CIDR} + 1))\n"
			echo -e `printSubnet ${_SUBNET1} $((${_CIDR} + 1))`
			echo -e `printSubnet ${_SUBNET2} $((${_CIDR} + 1))`
		# If Divider > 2, further divide
		elif [ $((${_DIVIDER} / 2)) -ge 1 ]
		then
			echo -e `divideSubnet ${_SUBNET1} $((${_CIDR} + 1)) $(( ${_DIVIDER} / 2 ))`
			echo -e `divideSubnet ${_SUBNET2} $((${_CIDR} + 1)) $(( ${_DIVIDER} - $((${_DIVIDER} / 2)) ))`
		fi
	
	fi
}

#Function to display info about subnet
function printSubnet()
{
	_BINARY=$1
	_CIDR=$2
	_NETWORK_BINARY=${_BINARY:0:${_CIDR}}
	_ADDRESS_BINARY=`echo ${_BINARY:${_CIDR}} | tr "1" "0"`	
	_BROADCAST_BINARY=${_NETWORK_BINARY}`echo ${_BINARY:${_CIDR}} | tr "0" "1"`
	_GATEWAY_BINARY=${_NETWORK_BINARY}`echo ${_BINARY:${_CIDR}} | tr "1" "0"`
	printf "\n"
	printf "$((2#${_BINARY:0:8})).$((2#${_BINARY:8:8})).$((2#${_BINARY:16:8})).$((2#${_BINARY:24}))/${_CIDR} "
	printf "subnet $((2#${_BINARY:0:8})).$((2#${_BINARY:8:8})).$((2#${_BINARY:16:8})).$((2#${_BINARY:24})) "
	printf "broadcast $((2#${_BROADCAST_BINARY:0:8})).$((2#${_BROADCAST_BINARY:8:8})).$((2#${_BROADCAST_BINARY:16:8})).$(( $((2#${_BROADCAST_BINARY:24}))  )) "
	#Here we choose gateway = 1st address
	printf "gateway $((2#${_GATEWAY_BINARY:0:8})).$((2#${_GATEWAY_BINARY:8:8})).$((2#${_GATEWAY_BINARY:16:8})).$(( $((2#${_GATEWAY_BINARY:24})) + 1 )) "
	printf "hosts $(( $(( 2#${_BROADCAST_BINARY:${_CIDR}} )) -2 ))"
}

#Read input 
INPUT1=($(echo $1 | tr "/" "\n"))
DIVIDER_INPUT=$2

#Get network and cidr info
NETWORK_INPUT=($(echo ${INPUT1[0]} | tr "." "\n"))
CIDR_INPUT=${INPUT1[1]}

#Echo back input
echo "Network is "${INPUT1}
echo "CIDR is "$CIDR_INPUT
echo "Divide into "$DIVIDER_INPUT" networks"
#echo ${network[*]

#Read IP address into octet
BINARY=""
for i in {0..3}
do
	BINARY=${BINARY}`convip "${NETWORK_INPUT[i]}"`
done

echo -e `divideSubnet ${BINARY} ${CIDR_INPUT} ${DIVIDER_INPUT}`
  






