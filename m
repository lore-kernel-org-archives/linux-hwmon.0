Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EF33C433ED
	for <linux-hwmon@archiver.kernel.org>; Sun, 11 Apr 2021 16:42:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 164C2601FC
	for <linux-hwmon@archiver.kernel.org>; Sun, 11 Apr 2021 16:42:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235786AbhDKQmv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 11 Apr 2021 12:42:51 -0400
Received: from mout.gmx.net ([212.227.17.21]:47981 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235640AbhDKQmv (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 11 Apr 2021 12:42:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1618159353;
        bh=igjPUT+lhwveH1OOt9eN/3wjXDpukopfOj93Kv0JTQI=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=UQFMwqDWBpTaHUJRo05KpCFVCU/TGATcsGhBWUAvPqUlXRLtZ4vjH5pOhJ/ITaaIr
         w5iyd6odOvN0IycnsI6AkEv9MHHfgHUDJBIBC5MpNuEVEt3YuJvzfrSqHihsstMYjF
         eR4vKvFPt7PSeZ8r8bht1uYw76whwlHgwg1LWwnA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([91.0.99.26]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MsYqp-1look619dz-00txis; Sun, 11
 Apr 2021 18:42:33 +0200
From:   W_Armin@gmx.de
To:     hdegoede@redhat.com
Cc:     linux-hwmon@vger.kernel.org, Armin Wolf <W_Armin@gmx.de>
Subject: [PATCH 1/2] hwmon: (sch5627) Convert to hwmon_device_register_with_info()
Date:   Sun, 11 Apr 2021 18:42:24 +0200
Message-Id: <20210411164225.11967-2-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210411164225.11967-1-W_Armin@gmx.de>
References: <20210411164225.11967-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bAVkunqOAwL5k4h3H3v1tAbxRTQaH4VF1gnxJU6s2wT+gqahsgs
 dfElAPjSRtSdBTsFOwINB0nwsPepGSowNE87zciYDBZf58tAmfObm4YbtuzJIbAedMhaLtl
 NZLv45NhNhRVwdXoCKO1E20VoDK1mDajwreHYR4cCIQ1QJpVFXYTJeC0AD7Vo1rVL02rBl6
 TGNhhnX7sbVIaFGfCB9yg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:L0kCHxDjuFg=:m2sT0k01BwTs5UPPRBfVsx
 Birp76I3Lrh91ZpJSTE4r6ay5P0CxOMxw8vCxYKXPIkIP/o/0dijeWYqWIalFgSPkvDlLw350
 B4djmdDDj2Wl8dLPlHWP6260fCmlpgrYfqWoKbUk4iw8Ssdt8UXxphnbnHAmbyiYw9tinn2bT
 UMG2nxnLa5s+d9HH/zGCoGOWFzYpHbEK4WeqVWqo3iRByGQWxGjDxhA8bUu9S8PEABSEcC6oG
 5/ZFQB75jQIiyW8wpMPSC9PLP6jjnCd2Wie7gHzZFUxhelWVGjuA/g8673FjdkegS7nAZKUdL
 V3AX+R4yw2gSEExlNaUkEpPqg50e7XDlaAa2y9wf94AAFnFf1I4DcabqhMTUNxvYNuymfGl7Z
 6jVVQ7mI42XtHod3N0A8P44q90mbR3iWwB644smvnna4VOsOaYKh+CXuAKN+NqYRSEO4epL7a
 GUOtvQJDvsIX44LDzBE8yVhADSui9/uaE4w+LZ96BDR2E98pdqbg1K5UH8/hAw8cBVADQoXbb
 UFuypp//afQmKcsMRsAjPzkMBhpidVtPLbKEM1f+aF9FDfAcIaHSny6nIUfEIqCuqxvKfkEu2
 UvGkonen1HiwtPIwj0n8j6nC4xg8SXS36Ao9ChZeGKppVDJhLtkVf7YuXBht6mrw+ncNIWt1X
 nNJgYcwk3kOLEeFy4ejENjPhNoMDh2AaDUbor2mChop9LwbLelt0HuW5Ub+xxx1kHnV4ANDf2
 iffIXrP+pJtcOAw7JnyCMl26Y6Cm0OzXcdR+OOiyugrPl1COiKx82nVt4EQmSomn/Y9jEFliK
 I7jKL7E0/ta+qA/3LdRUWHXHnsqS7wrrsKSAjheW6Gn930QY87L70xZYpIKN0KE22gBNK6c+F
 kXKHjIVOZEhZD+JHKPKhan/kqEsEuiF8X/+kMFAnxd6TU9LC3/pkpJtyoDWsbE17KE9ZPAZJw
 VpHRo6XSuc9rTSvcCbmyKIHEEu5HPy63g6V5LfmMMqOiDkkcZGFTwUcQtiDGJS/qi8HFiBRQ9
 1S8G2xXc3zfD6aRn+3LUWznlmCx2qKszld76Dtvqu+otbokoXL433jhFE+H8BuEKQq4r+ECEK
 kG/lYyWOsH06mpHIKOF4VQwiPGKKgS5gQ3P8Okn10ScxapkI3szSLRWczQcIiWrc3vZqM0mR+
 S9mvqW4wwKGMCPLEG+ysQSquc6aXLgPeYAts5uZM7D/elZCqKTmn8Vjrf99V1DwlxzU2g=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

hwmon_device_register() is deprecated.
Convert driver to use hwmon_device_register_with_info() and
remove sysfs attributes which are now being handled by the
hwmon subsystem.

Channel handling was inspired by corsair-cpro.

Tested on a Fujitsu Esprimo P720.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/hwmon/sch5627.c | 343 +++++++++++++---------------------------
 1 file changed, 111 insertions(+), 232 deletions(-)

diff --git a/drivers/hwmon/sch5627.c b/drivers/hwmon/sch5627.c
index a7e0d7bcf923..023376082ee6 100644
=2D-- a/drivers/hwmon/sch5627.c
+++ b/drivers/hwmon/sch5627.c
@@ -12,7 +12,6 @@
 #include <linux/jiffies.h>
 #include <linux/platform_device.h>
 #include <linux/hwmon.h>
-#include <linux/hwmon-sysfs.h>
 #include <linux/err.h>
 #include <linux/mutex.h>
 #include "sch56xx-common.h"
@@ -192,249 +191,135 @@ static int reg_to_rpm(u16 reg)
 	return 5400540 / reg;
 }

-static ssize_t name_show(struct device *dev, struct device_attribute *dev=
attr,
-	char *buf)
+static umode_t sch5627_is_visible(const void *drvdata, enum hwmon_sensor_=
types type, u32 attr,
+				  int channel)
 {
-	return sysfs_emit(buf, "%s\n", DEVNAME);
+	return 0444;
 }

-static ssize_t temp_show(struct device *dev, struct device_attribute *dev=
attr,
-			 char *buf)
+static int sch5627_read(struct device *dev, enum hwmon_sensor_types type,=
 u32 attr, int channel,
+			long *val)
 {
-	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(devattr);
 	struct sch5627_data *data =3D sch5627_update_device(dev);
-	int val;
+	int ret;

 	if (IS_ERR(data))
 		return PTR_ERR(data);

-	val =3D reg_to_temp(data->temp[attr->index]);
-	return sysfs_emit(buf, "%d\n", val);
-}
-
-static ssize_t temp_fault_show(struct device *dev,
-			       struct device_attribute *devattr, char *buf)
-{
-	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(devattr);
-	struct sch5627_data *data =3D sch5627_update_device(dev);
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	return sysfs_emit(buf, "%d\n", data->temp[attr->index] =3D=3D 0);
-}
-
-static ssize_t temp_max_show(struct device *dev,
-			     struct device_attribute *devattr, char *buf)
-{
-	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(devattr);
-	struct sch5627_data *data =3D dev_get_drvdata(dev);
-	int val;
-
-	val =3D reg_to_temp_limit(data->temp_max[attr->index]);
-	return sysfs_emit(buf, "%d\n", val);
-}
-
-static ssize_t temp_crit_show(struct device *dev,
-			      struct device_attribute *devattr, char *buf)
-{
-	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(devattr);
-	struct sch5627_data *data =3D dev_get_drvdata(dev);
-	int val;
-
-	val =3D reg_to_temp_limit(data->temp_crit[attr->index]);
-	return sysfs_emit(buf, "%d\n", val);
-}
-
-static ssize_t fan_show(struct device *dev, struct device_attribute *deva=
ttr,
-			char *buf)
-{
-	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(devattr);
-	struct sch5627_data *data =3D sch5627_update_device(dev);
-	int val;
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	val =3D reg_to_rpm(data->fan[attr->index]);
-	if (val < 0)
-		return val;
-
-	return sysfs_emit(buf, "%d\n", val);
-}
-
-static ssize_t fan_fault_show(struct device *dev,
-			      struct device_attribute *devattr, char *buf)
-{
-	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(devattr);
-	struct sch5627_data *data =3D sch5627_update_device(dev);
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	return sysfs_emit(buf, "%d\n",
-			  data->fan[attr->index] =3D=3D 0xffff);
-}
-
-static ssize_t fan_min_show(struct device *dev,
-			    struct device_attribute *devattr, char *buf)
-{
-	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(devattr);
-	struct sch5627_data *data =3D dev_get_drvdata(dev);
-	int val =3D reg_to_rpm(data->fan_min[attr->index]);
-	if (val < 0)
-		return val;
-
-	return sysfs_emit(buf, "%d\n", val);
-}
-
-static ssize_t in_show(struct device *dev, struct device_attribute *devat=
tr,
-		       char *buf)
-{
-	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(devattr);
-	struct sch5627_data *data =3D sch5627_update_device(dev);
-	int val;
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
+	switch (type) {
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_input:
+			*val =3D reg_to_temp(data->temp[channel]);
+			return 0;
+		case hwmon_temp_max:
+			*val =3D reg_to_temp_limit(data->temp_max[channel]);
+			return 0;
+		case hwmon_temp_crit:
+			*val =3D reg_to_temp_limit(data->temp_crit[channel]);
+			return 0;
+		case hwmon_temp_fault:
+			*val =3D (data->temp[channel] =3D=3D 0);
+			return 0;
+		default:
+			break;
+		}
+		break;
+	case hwmon_fan:
+		switch (attr) {
+		case hwmon_fan_input:
+			ret =3D reg_to_rpm(data->fan[channel]);
+			if (ret < 0)
+				return ret;
+			*val =3D ret;
+			return 0;
+		case hwmon_fan_min:
+			ret =3D reg_to_rpm(data->fan_min[channel]);
+			if (ret < 0)
+				return ret;
+			*val =3D ret;
+			return 0;
+		case hwmon_fan_fault:
+			*val =3D (data->fan[channel] =3D=3D 0xffff);
+			return 0;
+		default:
+			break;
+		}
+		break;
+	case hwmon_in:
+		switch (attr) {
+		case hwmon_in_input:
+			*val =3D DIV_ROUND_CLOSEST(data->in[channel] * SCH5627_REG_IN_FACTOR[c=
hannel],
+						 10000);
+			return 0;
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}

-	val =3D DIV_ROUND_CLOSEST(
-		data->in[attr->index] * SCH5627_REG_IN_FACTOR[attr->index],
-		10000);
-	return sysfs_emit(buf, "%d\n", val);
+	return -EOPNOTSUPP;
 }

-static ssize_t in_label_show(struct device *dev,
-			     struct device_attribute *devattr, char *buf)
+static int sch5627_read_string(struct device *dev, enum hwmon_sensor_type=
s type, u32 attr,
+			       int channel, const char **str)
 {
-	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(devattr);
+	switch (type) {
+	case hwmon_in:
+		switch (attr) {
+		case hwmon_in_label:
+			*str =3D SCH5627_IN_LABELS[channel];
+			return 0;
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}

-	return sysfs_emit(buf, "%s\n",
-			  SCH5627_IN_LABELS[attr->index]);
+	return -EOPNOTSUPP;
 }

-static DEVICE_ATTR_RO(name);
-static SENSOR_DEVICE_ATTR_RO(temp1_input, temp, 0);
-static SENSOR_DEVICE_ATTR_RO(temp2_input, temp, 1);
-static SENSOR_DEVICE_ATTR_RO(temp3_input, temp, 2);
-static SENSOR_DEVICE_ATTR_RO(temp4_input, temp, 3);
-static SENSOR_DEVICE_ATTR_RO(temp5_input, temp, 4);
-static SENSOR_DEVICE_ATTR_RO(temp6_input, temp, 5);
-static SENSOR_DEVICE_ATTR_RO(temp7_input, temp, 6);
-static SENSOR_DEVICE_ATTR_RO(temp8_input, temp, 7);
-static SENSOR_DEVICE_ATTR_RO(temp1_fault, temp_fault, 0);
-static SENSOR_DEVICE_ATTR_RO(temp2_fault, temp_fault, 1);
-static SENSOR_DEVICE_ATTR_RO(temp3_fault, temp_fault, 2);
-static SENSOR_DEVICE_ATTR_RO(temp4_fault, temp_fault, 3);
-static SENSOR_DEVICE_ATTR_RO(temp5_fault, temp_fault, 4);
-static SENSOR_DEVICE_ATTR_RO(temp6_fault, temp_fault, 5);
-static SENSOR_DEVICE_ATTR_RO(temp7_fault, temp_fault, 6);
-static SENSOR_DEVICE_ATTR_RO(temp8_fault, temp_fault, 7);
-static SENSOR_DEVICE_ATTR_RO(temp1_max, temp_max, 0);
-static SENSOR_DEVICE_ATTR_RO(temp2_max, temp_max, 1);
-static SENSOR_DEVICE_ATTR_RO(temp3_max, temp_max, 2);
-static SENSOR_DEVICE_ATTR_RO(temp4_max, temp_max, 3);
-static SENSOR_DEVICE_ATTR_RO(temp5_max, temp_max, 4);
-static SENSOR_DEVICE_ATTR_RO(temp6_max, temp_max, 5);
-static SENSOR_DEVICE_ATTR_RO(temp7_max, temp_max, 6);
-static SENSOR_DEVICE_ATTR_RO(temp8_max, temp_max, 7);
-static SENSOR_DEVICE_ATTR_RO(temp1_crit, temp_crit, 0);
-static SENSOR_DEVICE_ATTR_RO(temp2_crit, temp_crit, 1);
-static SENSOR_DEVICE_ATTR_RO(temp3_crit, temp_crit, 2);
-static SENSOR_DEVICE_ATTR_RO(temp4_crit, temp_crit, 3);
-static SENSOR_DEVICE_ATTR_RO(temp5_crit, temp_crit, 4);
-static SENSOR_DEVICE_ATTR_RO(temp6_crit, temp_crit, 5);
-static SENSOR_DEVICE_ATTR_RO(temp7_crit, temp_crit, 6);
-static SENSOR_DEVICE_ATTR_RO(temp8_crit, temp_crit, 7);
-
-static SENSOR_DEVICE_ATTR_RO(fan1_input, fan, 0);
-static SENSOR_DEVICE_ATTR_RO(fan2_input, fan, 1);
-static SENSOR_DEVICE_ATTR_RO(fan3_input, fan, 2);
-static SENSOR_DEVICE_ATTR_RO(fan4_input, fan, 3);
-static SENSOR_DEVICE_ATTR_RO(fan1_fault, fan_fault, 0);
-static SENSOR_DEVICE_ATTR_RO(fan2_fault, fan_fault, 1);
-static SENSOR_DEVICE_ATTR_RO(fan3_fault, fan_fault, 2);
-static SENSOR_DEVICE_ATTR_RO(fan4_fault, fan_fault, 3);
-static SENSOR_DEVICE_ATTR_RO(fan1_min, fan_min, 0);
-static SENSOR_DEVICE_ATTR_RO(fan2_min, fan_min, 1);
-static SENSOR_DEVICE_ATTR_RO(fan3_min, fan_min, 2);
-static SENSOR_DEVICE_ATTR_RO(fan4_min, fan_min, 3);
-
-static SENSOR_DEVICE_ATTR_RO(in0_input, in, 0);
-static SENSOR_DEVICE_ATTR_RO(in1_input, in, 1);
-static SENSOR_DEVICE_ATTR_RO(in2_input, in, 2);
-static SENSOR_DEVICE_ATTR_RO(in3_input, in, 3);
-static SENSOR_DEVICE_ATTR_RO(in4_input, in, 4);
-static SENSOR_DEVICE_ATTR_RO(in0_label, in_label, 0);
-static SENSOR_DEVICE_ATTR_RO(in1_label, in_label, 1);
-static SENSOR_DEVICE_ATTR_RO(in2_label, in_label, 2);
-static SENSOR_DEVICE_ATTR_RO(in3_label, in_label, 3);
-
-static struct attribute *sch5627_attributes[] =3D {
-	&dev_attr_name.attr,
-
-	&sensor_dev_attr_temp1_input.dev_attr.attr,
-	&sensor_dev_attr_temp2_input.dev_attr.attr,
-	&sensor_dev_attr_temp3_input.dev_attr.attr,
-	&sensor_dev_attr_temp4_input.dev_attr.attr,
-	&sensor_dev_attr_temp5_input.dev_attr.attr,
-	&sensor_dev_attr_temp6_input.dev_attr.attr,
-	&sensor_dev_attr_temp7_input.dev_attr.attr,
-	&sensor_dev_attr_temp8_input.dev_attr.attr,
-	&sensor_dev_attr_temp1_fault.dev_attr.attr,
-	&sensor_dev_attr_temp2_fault.dev_attr.attr,
-	&sensor_dev_attr_temp3_fault.dev_attr.attr,
-	&sensor_dev_attr_temp4_fault.dev_attr.attr,
-	&sensor_dev_attr_temp5_fault.dev_attr.attr,
-	&sensor_dev_attr_temp6_fault.dev_attr.attr,
-	&sensor_dev_attr_temp7_fault.dev_attr.attr,
-	&sensor_dev_attr_temp8_fault.dev_attr.attr,
-	&sensor_dev_attr_temp1_max.dev_attr.attr,
-	&sensor_dev_attr_temp2_max.dev_attr.attr,
-	&sensor_dev_attr_temp3_max.dev_attr.attr,
-	&sensor_dev_attr_temp4_max.dev_attr.attr,
-	&sensor_dev_attr_temp5_max.dev_attr.attr,
-	&sensor_dev_attr_temp6_max.dev_attr.attr,
-	&sensor_dev_attr_temp7_max.dev_attr.attr,
-	&sensor_dev_attr_temp8_max.dev_attr.attr,
-	&sensor_dev_attr_temp1_crit.dev_attr.attr,
-	&sensor_dev_attr_temp2_crit.dev_attr.attr,
-	&sensor_dev_attr_temp3_crit.dev_attr.attr,
-	&sensor_dev_attr_temp4_crit.dev_attr.attr,
-	&sensor_dev_attr_temp5_crit.dev_attr.attr,
-	&sensor_dev_attr_temp6_crit.dev_attr.attr,
-	&sensor_dev_attr_temp7_crit.dev_attr.attr,
-	&sensor_dev_attr_temp8_crit.dev_attr.attr,
-
-	&sensor_dev_attr_fan1_input.dev_attr.attr,
-	&sensor_dev_attr_fan2_input.dev_attr.attr,
-	&sensor_dev_attr_fan3_input.dev_attr.attr,
-	&sensor_dev_attr_fan4_input.dev_attr.attr,
-	&sensor_dev_attr_fan1_fault.dev_attr.attr,
-	&sensor_dev_attr_fan2_fault.dev_attr.attr,
-	&sensor_dev_attr_fan3_fault.dev_attr.attr,
-	&sensor_dev_attr_fan4_fault.dev_attr.attr,
-	&sensor_dev_attr_fan1_min.dev_attr.attr,
-	&sensor_dev_attr_fan2_min.dev_attr.attr,
-	&sensor_dev_attr_fan3_min.dev_attr.attr,
-	&sensor_dev_attr_fan4_min.dev_attr.attr,
-
-	&sensor_dev_attr_in0_input.dev_attr.attr,
-	&sensor_dev_attr_in1_input.dev_attr.attr,
-	&sensor_dev_attr_in2_input.dev_attr.attr,
-	&sensor_dev_attr_in3_input.dev_attr.attr,
-	&sensor_dev_attr_in4_input.dev_attr.attr,
-	&sensor_dev_attr_in0_label.dev_attr.attr,
-	&sensor_dev_attr_in1_label.dev_attr.attr,
-	&sensor_dev_attr_in2_label.dev_attr.attr,
-	&sensor_dev_attr_in3_label.dev_attr.attr,
-	/* No in4_label as in4 is a generic input pin */
+static const struct hwmon_ops sch5627_ops =3D {
+	.is_visible =3D sch5627_is_visible,
+	.read =3D sch5627_read,
+	.read_string =3D sch5627_read_string,
+};

+static const struct hwmon_channel_info *sch5627_info[] =3D {
+	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT | HWMON_T_FAULT,
+			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT | HWMON_T_FAULT,
+			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT | HWMON_T_FAULT,
+			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT | HWMON_T_FAULT,
+			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT | HWMON_T_FAULT,
+			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT | HWMON_T_FAULT,
+			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT | HWMON_T_FAULT,
+			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT | HWMON_T_FAULT
+			   ),
+	HWMON_CHANNEL_INFO(fan,
+			   HWMON_F_INPUT | HWMON_F_MIN | HWMON_F_FAULT,
+			   HWMON_F_INPUT | HWMON_F_MIN | HWMON_F_FAULT,
+			   HWMON_F_INPUT | HWMON_F_MIN | HWMON_F_FAULT,
+			   HWMON_F_INPUT | HWMON_F_MIN | HWMON_F_FAULT
+			   ),
+	HWMON_CHANNEL_INFO(in,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT
+			   ),
 	NULL
 };

-static const struct attribute_group sch5627_group =3D {
-	.attrs =3D sch5627_attributes,
+static const struct hwmon_chip_info sch5627_chip_info =3D {
+	.ops =3D &sch5627_ops,
+	.info =3D sch5627_info,
 };

 static int sch5627_remove(struct platform_device *pdev)
@@ -447,8 +332,6 @@ static int sch5627_remove(struct platform_device *pdev=
)
 	if (data->hwmon_dev)
 		hwmon_device_unregister(data->hwmon_dev);

-	sysfs_remove_group(&pdev->dev.kobj, &sch5627_group);
-
 	return 0;
 }

@@ -552,12 +435,8 @@ static int sch5627_probe(struct platform_device *pdev=
)
 	pr_info("firmware build: code 0x%02X, id 0x%04X, hwmon: rev 0x%02X\n",
 		build_code, build_id, hwmon_rev);

-	/* Register sysfs interface files */
-	err =3D sysfs_create_group(&pdev->dev.kobj, &sch5627_group);
-	if (err)
-		goto error;
-
-	data->hwmon_dev =3D hwmon_device_register(&pdev->dev);
+	data->hwmon_dev =3D hwmon_device_register_with_info(&pdev->dev, DEVNAME,=
 data,
+							  &sch5627_chip_info, 0);
 	if (IS_ERR(data->hwmon_dev)) {
 		err =3D PTR_ERR(data->hwmon_dev);
 		data->hwmon_dev =3D NULL;
=2D-
2.20.1

