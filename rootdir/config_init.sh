# software configuration related boot actions
#please sync to RF BAND
FULL_BAND=8
WW_BAND=0
TW_BAND=1
CN_BAND=2
US_BAND=3
TR_BAND=4
TEST_BAND=12
# ZX550ML RF BAND
WW_US_BAND=15
TW_CN_JP_BAND=0
WW_TEST_BAND=1
TW_TEST_BAND=8

# project ID
ZE550ML=23
ZE551ML=31
ZR550ML=28
ZX550ML=27
ZE551ML_CKD=30

RFSKUID_DETECT=$(cat /sys/module/intel_mid_sfi/parameters/rf_sku_id)
PROJID_DETECT=$(cat /sys/module/intel_mid_sfi/parameters/project_id)
COUNTRY_CODE=$(cat /factory/PhoneInfodisk/country_code)

log -p i -t config_init "PROJID: $PROJID_DETECT ,RFSKUID: $RFSKUID_DETECT"

if [ -n "$PROJID_DETECT" ]; then
	case $PROJID_DETECT in
		"$ZE550ML" | "$ZE551ML" | "$ZE551ML_CKD")

			if [ "$COUNTRY_CODE" = "TH" ]; then
				echo "V1_DSDA_ZE550ML_TH" > /config/local_config

			elif [ "$COUNTRY_CODE" = "JP" ]; then
				echo "V1_DSDA_ZE550ML_JP" > /config/local_config

			elif [ -n "$RFSKUID_DETECT" ]; then
				case $RFSKUID_DETECT in
					"$FULL_BAND")
						echo "V1_DSDA_ZE550ML_FULL" > /config/local_config
						;;
					"$WW_BAND")
						echo "V1_DSDA_ZE550ML_WW" > /config/local_config
						;;
					"$TW_BAND")
						echo "V1_DSDA_ZE550ML_TW" > /config/local_config
						;;
					"$CN_BAND")
						echo "V1_DSDA_ZE550ML_CN" > /config/local_config
						;;
					"$US_BAND")
						echo "V1_DSDA_ZE550ML_US" > /config/local_config
						;;
					"$TR_BAND")
						echo "V1_DSDA_ZE550ML_TR" > /config/local_config
						;;
					"$TEST_BAND")
						echo "V1_DSDA_ZE550ML_TEST" > /config/local_config
						;;
					*)
						echo "V1_DSDA" > /config/local_config
						;;
				esac
			else
				echo "V1_DSDA" > /config/local_config
			fi
			;;
		"$ZX550ML")
			if [ -n "$RFSKUID_DETECT" ]; then
				case $RFSKUID_DETECT in
					"$WW_US_BAND")
						echo "V1_SINGLE_ZX550ML_WW" > /config/local_config
						;;
					"$TW_CN_JP_BAND")
						echo "V1_SINGLE_ZX550ML_TW" > /config/local_config
						;;
					"$WW_TEST_BAND")
						echo "V1_SINGLE_ZX550ML_WW" > /config/local_config
						;;
					"$TW_TEST_BAND")
						echo "V1_SINGLE_ZX550ML_TW" > /config/local_config
						;;
					*)
						echo "V1_SINGLE_ZX550ML" > /config/local_config
						;;
				esac
			else
				echo "V1_SINGLE_ZX550ML" > /config/local_config
			fi
			;;
		*)
			echo "V1_DSDA" > /config/local_config
			;;
	esac
else
        echo "V1_DSDA" > /config/local_config
fi

CONFIG_PATH=/local_cfg
PROPS_FILE=init.props

# Get selected software configuration

config=`cat /config/local_config`
mount -o bind /system/etc/catalog/$config /local_cfg

log -p i -t config_init "Activating configuration $config"

# Set properties for the selected configuration

# read all FeatureTeam's init.props file
for f in /local_cfg/*/init.props
do
    while read l; do

        # Ignore empty lines and comments
        case "$l" in
            ''|'#'*)
                continue
                ;;
        esac

        # Set property
        setprop `echo ${l/=/ }`

    done < $f
done
