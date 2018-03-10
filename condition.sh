#! /bin/bash -ex


 if [ -z "${RETVAL}" -a -e "/etc/system-release" ] || [ -z "${RETVAL}" -a -e "/etc/rhel-release" ]; then
        RELEASE_OUT=$(head -n1 /etc/system-release) || $(head -n1 /etc/rhel-release)
        case "${RELEASE_OUT}" in
            Red\ Hat\ Enterprise\ Linux*)
                RETVAL="rhel"
               ;;
            CentOS*)
                RETVAL="centos"
                ;;
            Fedora*)
                RETVAL="fedora"
                ;;
            Amazon\ Linux\ release*)
                RETVAL="ami"
                ;;
esac
elif [ -z "${RETVAL}" -a -e "/etc/lsb-release" ]; then

RELEASE_OUT=$(head -n1 /etc/lsb-release)

     case "${RELEASE_OUT}" in
            DISTRIB_ID=Ubuntu)
                RETVAL="Ubuntu"
               ;;
esac

echo $RELEASE_OUT
echo $RETVAL
fi



