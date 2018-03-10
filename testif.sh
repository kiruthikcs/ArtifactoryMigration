#! /bin/bash 


RETVAL=""
   if [ -z "${RETVAL}" -a -e "/etc/system-release" ] || [ -z "${RETVAL}" -a -e "/etc/lsb-release" ]; then
        RELEASE_OUT=$(head -n1 /etc/system-release) || $(head -n1 /etc/rhelm-release)
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
            DISTRIB_ID=Ubuntu)
                 RETVAL="Ubuntu"
                ;;
      esac
  echo $RETVAL

elif  [ -z "${RETVAL}" -a -e "/etc/lsb-release" ]; then
 RELEASE_OUT=$(head -n1 /etc/lsb-release)
        case "${RELEASE_OUT}" in
 DISTRIB_ID=Ubuntu)
                 RETVAL="Ubuntu"
                ;;
esac
   echo $RETVAL
fi

