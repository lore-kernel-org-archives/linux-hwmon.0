Return-Path: <SRS0=miNt=ZL=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11421C432C0
	for <linux-hwmon@archiver.kernel.org>; Tue, 19 Nov 2019 18:39:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 89FCC22409
	for <linux-hwmon@archiver.kernel.org>; Tue, 19 Nov 2019 18:39:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="e5OiSVUc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727173AbfKSSjU (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 19 Nov 2019 13:39:20 -0500
Received: from mx.treblig.org ([46.43.15.161]:55744 "EHLO mx.treblig.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726307AbfKSSjU (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 19 Nov 2019 13:39:20 -0500
X-Greylist: delayed 1232 seconds by postgrey-1.27 at vger.kernel.org; Tue, 19 Nov 2019 13:39:15 EST
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
        ; s=bytemarkmx; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
        Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=P80JCu8i6UZtyNuqj0afp9ErrS6U2+PfIGF54jgn25o=; b=e5OiSVUc2Egd+HVqL5CmKjS+9H
        04rNMNASXWEs1tt6dTWN+TIgcg8ZlrRKrknEV+ZoEgH1tyKRmZ+kITknyazeMyrwzsOEbQykKIqGy
        LTLHWgpuNeGm6+80ANTyyHW7kbFC2kpKQ1AxFYUoT9j6bCGaa06IXm9p40JuaNsUQxIcr4B2STVP5
        pwiKNe1f1RQnaxPNjG1MoR0ERdFJFaO8Mmlk1K3OLdOX8zfkcthsfSE2ATVem5p1a3v4To42jkMXN
        Mr4HhAjVy0bRb49Bv2ag9YexSHZxsWSLqTDGNdQzz3AKkN2X3XVbglE7/CiVfiflg+2Y7Gor5d1t0
        RBfiHwKQ==;
Received: from dg by mx.treblig.org with local (Exim 4.92)
        (envelope-from <dg@treblig.org>)
        id 1iX850-0002QD-Je; Tue, 19 Nov 2019 18:18:22 +0000
Date:   Tue, 19 Nov 2019 18:18:22 +0000
From:   "Dr. David Alan Gilbert" <linux@treblig.org>
To:     jdelvare@suse.com, linux@roeck-us.net
Cc:     linux-hwmon@vger.kernel.org
Subject: WIP: [PATCH] hwmon: (w83627ehf) convert to with_info interface
Message-ID: <20191119181822.GC26171@gallifrey>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/4.19.0-5-amd64 (x86_64)
X-Uptime: 18:00:59 up 79 days, 18:21,  1 user,  load average: 0.00, 0.00, 0.00
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


Hi Jean, Guenter,
  I'm part way through converting w83627ehf to use the devm_hwmon_device_re=
gister_with_info
interface and had some questions I'd appreciate the answer to.  My WIP
code is attached below.

  a) In the existing driver, all the pseudo files are showing up as:
     /sys/devices/platform/w83627ehf.656/blah_input
     with the rework:
     /sys/devices/platform/w83627ehf.656/hwmon/hwmon1/

     my reading is that the reworked one is correct?
     Although I guess the change is a pain for people with paths
     in tools.

  b) The device has an intrusion0_alarm & intrusion1_alarm
     that seems pretty common looking in drivers/hwmon - some other
     devices have a intrustion%d_beep.  Does it make sense to add
     a new hwmon_intrusion type to hwmon_sensor_types  ?

  c) The device has a bunch more pwm variants:
     pwm2_max_output, pwm2_start_output, pwm2_step_output, pwm2_stop_output,
     pwm2_stop_time, pwm2_target, pwm2_tolerance

     for each/some of it's outputs.   What's the right thing to
     do there? Add them all to hwmon_pwm_attr_templates ?
     (Unfortunately it looks like everyone has fun with their own
      pwm settings).

For reference, I seem to have a w83667hg on an ASRock P55M Pro.

The current status is that 'reading' seems to work (from what I can tell
but not looked at the PWM), and I've not converted the writers yet.

Thanks in advance,

Dave




=46rom 1cc4523c938824caa589769497abf71449511326 Mon Sep 17 00:00:00 2001
=46rom: "Dr. David Alan Gilbert" <linux@treblig.org>
Date: Sun, 17 Nov 2019 00:34:36 +0000
Subject: [PATCH] hwmon: (w83627ehf) convert to with_info interface

Convert the old hwmon_device_register code to
devm_hwmon_device_register_with_info.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/hwmon/w83627ehf.c | 802 ++++++++++++++++----------------------
 1 file changed, 338 insertions(+), 464 deletions(-)

diff --git a/drivers/hwmon/w83627ehf.c b/drivers/hwmon/w83627ehf.c
index eb171d15ac48..b82af0969d04 100644
--- a/drivers/hwmon/w83627ehf.c
+++ b/drivers/hwmon/w83627ehf.c
@@ -417,8 +417,8 @@ static inline u8 in_to_reg(u32 val, u8 nr, const u16 *s=
cale_in)
 struct w83627ehf_data {
 	int addr;	/* IO base of hw monitor block */
 	const char *name;
+	enum kinds kind; /* Convenience copy of sio_data->kind */
=20
-	struct device *hwmon_dev;
 	struct mutex lock;
=20
 	u16 reg_temp[NUM_REG_TEMP];
@@ -786,7 +786,6 @@ static struct w83627ehf_data *w83627ehf_update_device(s=
truct device *dev)
 {
 	struct w83627ehf_data *data =3D dev_get_drvdata(dev);
 	struct w83627ehf_sio_data *sio_data =3D dev_get_platdata(dev);
-
 	int i;
=20
 	mutex_lock(&data->update_lock);
@@ -923,25 +922,10 @@ static struct w83627ehf_data *w83627ehf_update_device=
(struct device *dev)
 	return data;
 }
=20
+#if 0
 /*
  * Sysfs callback functions
  */
-#define show_in_reg(reg) \
-static ssize_t \
-show_##reg(struct device *dev, struct device_attribute *attr, \
-	   char *buf) \
-{ \
-	struct w83627ehf_data *data =3D w83627ehf_update_device(dev); \
-	struct sensor_device_attribute *sensor_attr =3D \
-		to_sensor_dev_attr(attr); \
-	int nr =3D sensor_attr->index; \
-	return sprintf(buf, "%ld\n", in_from_reg(data->reg[nr], nr, \
-		       data->scale_in)); \
-}
-show_in_reg(in)
-show_in_reg(in_min)
-show_in_reg(in_max)
-
 #define store_in_reg(REG, reg) \
 static ssize_t \
 store_in_##reg(struct device *dev, struct device_attribute *attr, \
@@ -967,6 +951,7 @@ store_in_##reg(struct device *dev, struct device_attrib=
ute *attr, \
 store_in_reg(MIN, min)
 store_in_reg(MAX, max)
=20
+/* DAG! Note the 'index' here is odd - this is shared among all the alarms=
 */
 static ssize_t show_alarm(struct device *dev, struct device_attribute *att=
r,
 			  char *buf)
 {
@@ -976,88 +961,6 @@ static ssize_t show_alarm(struct device *dev, struct d=
evice_attribute *attr,
 	return sprintf(buf, "%u\n", (data->alarms >> nr) & 0x01);
 }
=20
-static struct sensor_device_attribute sda_in_input[] =3D {
-	SENSOR_ATTR(in0_input, S_IRUGO, show_in, NULL, 0),
-	SENSOR_ATTR(in1_input, S_IRUGO, show_in, NULL, 1),
-	SENSOR_ATTR(in2_input, S_IRUGO, show_in, NULL, 2),
-	SENSOR_ATTR(in3_input, S_IRUGO, show_in, NULL, 3),
-	SENSOR_ATTR(in4_input, S_IRUGO, show_in, NULL, 4),
-	SENSOR_ATTR(in5_input, S_IRUGO, show_in, NULL, 5),
-	SENSOR_ATTR(in6_input, S_IRUGO, show_in, NULL, 6),
-	SENSOR_ATTR(in7_input, S_IRUGO, show_in, NULL, 7),
-	SENSOR_ATTR(in8_input, S_IRUGO, show_in, NULL, 8),
-	SENSOR_ATTR(in9_input, S_IRUGO, show_in, NULL, 9),
-};
-
-static struct sensor_device_attribute sda_in_alarm[] =3D {
-	SENSOR_ATTR(in0_alarm, S_IRUGO, show_alarm, NULL, 0),
-	SENSOR_ATTR(in1_alarm, S_IRUGO, show_alarm, NULL, 1),
-	SENSOR_ATTR(in2_alarm, S_IRUGO, show_alarm, NULL, 2),
-	SENSOR_ATTR(in3_alarm, S_IRUGO, show_alarm, NULL, 3),
-	SENSOR_ATTR(in4_alarm, S_IRUGO, show_alarm, NULL, 8),
-	SENSOR_ATTR(in5_alarm, S_IRUGO, show_alarm, NULL, 21),
-	SENSOR_ATTR(in6_alarm, S_IRUGO, show_alarm, NULL, 20),
-	SENSOR_ATTR(in7_alarm, S_IRUGO, show_alarm, NULL, 16),
-	SENSOR_ATTR(in8_alarm, S_IRUGO, show_alarm, NULL, 17),
-	SENSOR_ATTR(in9_alarm, S_IRUGO, show_alarm, NULL, 19),
-};
-
-static struct sensor_device_attribute sda_in_min[] =3D {
-	SENSOR_ATTR(in0_min, S_IWUSR | S_IRUGO, show_in_min, store_in_min, 0),
-	SENSOR_ATTR(in1_min, S_IWUSR | S_IRUGO, show_in_min, store_in_min, 1),
-	SENSOR_ATTR(in2_min, S_IWUSR | S_IRUGO, show_in_min, store_in_min, 2),
-	SENSOR_ATTR(in3_min, S_IWUSR | S_IRUGO, show_in_min, store_in_min, 3),
-	SENSOR_ATTR(in4_min, S_IWUSR | S_IRUGO, show_in_min, store_in_min, 4),
-	SENSOR_ATTR(in5_min, S_IWUSR | S_IRUGO, show_in_min, store_in_min, 5),
-	SENSOR_ATTR(in6_min, S_IWUSR | S_IRUGO, show_in_min, store_in_min, 6),
-	SENSOR_ATTR(in7_min, S_IWUSR | S_IRUGO, show_in_min, store_in_min, 7),
-	SENSOR_ATTR(in8_min, S_IWUSR | S_IRUGO, show_in_min, store_in_min, 8),
-	SENSOR_ATTR(in9_min, S_IWUSR | S_IRUGO, show_in_min, store_in_min, 9),
-};
-
-static struct sensor_device_attribute sda_in_max[] =3D {
-	SENSOR_ATTR(in0_max, S_IWUSR | S_IRUGO, show_in_max, store_in_max, 0),
-	SENSOR_ATTR(in1_max, S_IWUSR | S_IRUGO, show_in_max, store_in_max, 1),
-	SENSOR_ATTR(in2_max, S_IWUSR | S_IRUGO, show_in_max, store_in_max, 2),
-	SENSOR_ATTR(in3_max, S_IWUSR | S_IRUGO, show_in_max, store_in_max, 3),
-	SENSOR_ATTR(in4_max, S_IWUSR | S_IRUGO, show_in_max, store_in_max, 4),
-	SENSOR_ATTR(in5_max, S_IWUSR | S_IRUGO, show_in_max, store_in_max, 5),
-	SENSOR_ATTR(in6_max, S_IWUSR | S_IRUGO, show_in_max, store_in_max, 6),
-	SENSOR_ATTR(in7_max, S_IWUSR | S_IRUGO, show_in_max, store_in_max, 7),
-	SENSOR_ATTR(in8_max, S_IWUSR | S_IRUGO, show_in_max, store_in_max, 8),
-	SENSOR_ATTR(in9_max, S_IWUSR | S_IRUGO, show_in_max, store_in_max, 9),
-};
-
-static ssize_t
-show_fan(struct device *dev, struct device_attribute *attr, char *buf)
-{
-	struct w83627ehf_data *data =3D w83627ehf_update_device(dev);
-	struct sensor_device_attribute *sensor_attr =3D to_sensor_dev_attr(attr);
-	int nr =3D sensor_attr->index;
-	return sprintf(buf, "%d\n", data->rpm[nr]);
-}
-
-static ssize_t
-show_fan_min(struct device *dev, struct device_attribute *attr, char *buf)
-{
-	struct w83627ehf_data *data =3D w83627ehf_update_device(dev);
-	struct sensor_device_attribute *sensor_attr =3D to_sensor_dev_attr(attr);
-	int nr =3D sensor_attr->index;
-	return sprintf(buf, "%d\n",
-		       data->fan_from_reg_min(data->fan_min[nr],
-					      data->fan_div[nr]));
-}
-
-static ssize_t
-show_fan_div(struct device *dev, struct device_attribute *attr,
-	     char *buf)
-{
-	struct w83627ehf_data *data =3D w83627ehf_update_device(dev);
-	struct sensor_device_attribute *sensor_attr =3D to_sensor_dev_attr(attr);
-	int nr =3D sensor_attr->index;
-	return sprintf(buf, "%u\n", div_from_reg(data->fan_div[nr]));
-}
-
 static ssize_t
 store_fan_min(struct device *dev, struct device_attribute *attr,
 	      const char *buf, size_t count)
@@ -1151,67 +1054,6 @@ store_fan_min(struct device *dev, struct device_attr=
ibute *attr,
 	return count;
 }
=20
-static struct sensor_device_attribute sda_fan_input[] =3D {
-	SENSOR_ATTR(fan1_input, S_IRUGO, show_fan, NULL, 0),
-	SENSOR_ATTR(fan2_input, S_IRUGO, show_fan, NULL, 1),
-	SENSOR_ATTR(fan3_input, S_IRUGO, show_fan, NULL, 2),
-	SENSOR_ATTR(fan4_input, S_IRUGO, show_fan, NULL, 3),
-	SENSOR_ATTR(fan5_input, S_IRUGO, show_fan, NULL, 4),
-};
-
-static struct sensor_device_attribute sda_fan_alarm[] =3D {
-	SENSOR_ATTR(fan1_alarm, S_IRUGO, show_alarm, NULL, 6),
-	SENSOR_ATTR(fan2_alarm, S_IRUGO, show_alarm, NULL, 7),
-	SENSOR_ATTR(fan3_alarm, S_IRUGO, show_alarm, NULL, 11),
-	SENSOR_ATTR(fan4_alarm, S_IRUGO, show_alarm, NULL, 10),
-	SENSOR_ATTR(fan5_alarm, S_IRUGO, show_alarm, NULL, 23),
-};
-
-static struct sensor_device_attribute sda_fan_min[] =3D {
-	SENSOR_ATTR(fan1_min, S_IWUSR | S_IRUGO, show_fan_min,
-		    store_fan_min, 0),
-	SENSOR_ATTR(fan2_min, S_IWUSR | S_IRUGO, show_fan_min,
-		    store_fan_min, 1),
-	SENSOR_ATTR(fan3_min, S_IWUSR | S_IRUGO, show_fan_min,
-		    store_fan_min, 2),
-	SENSOR_ATTR(fan4_min, S_IWUSR | S_IRUGO, show_fan_min,
-		    store_fan_min, 3),
-	SENSOR_ATTR(fan5_min, S_IWUSR | S_IRUGO, show_fan_min,
-		    store_fan_min, 4),
-};
-
-static struct sensor_device_attribute sda_fan_div[] =3D {
-	SENSOR_ATTR(fan1_div, S_IRUGO, show_fan_div, NULL, 0),
-	SENSOR_ATTR(fan2_div, S_IRUGO, show_fan_div, NULL, 1),
-	SENSOR_ATTR(fan3_div, S_IRUGO, show_fan_div, NULL, 2),
-	SENSOR_ATTR(fan4_div, S_IRUGO, show_fan_div, NULL, 3),
-	SENSOR_ATTR(fan5_div, S_IRUGO, show_fan_div, NULL, 4),
-};
-
-static ssize_t
-show_temp_label(struct device *dev, struct device_attribute *attr, char *b=
uf)
-{
-	struct w83627ehf_data *data =3D w83627ehf_update_device(dev);
-	struct sensor_device_attribute *sensor_attr =3D to_sensor_dev_attr(attr);
-	int nr =3D sensor_attr->index;
-	return sprintf(buf, "%s\n", data->temp_label[data->temp_src[nr]]);
-}
-
-#define show_temp_reg(addr, reg) \
-static ssize_t \
-show_##reg(struct device *dev, struct device_attribute *attr, \
-	   char *buf) \
-{ \
-	struct w83627ehf_data *data =3D w83627ehf_update_device(dev); \
-	struct sensor_device_attribute *sensor_attr =3D \
-		to_sensor_dev_attr(attr); \
-	int nr =3D sensor_attr->index; \
-	return sprintf(buf, "%d\n", LM75_TEMP_FROM_REG(data->reg[nr])); \
-}
-show_temp_reg(reg_temp, temp);
-show_temp_reg(reg_temp_over, temp_max);
-show_temp_reg(reg_temp_hyst, temp_max_hyst);
-
 #define store_temp_reg(addr, reg) \
 static ssize_t \
 store_##reg(struct device *dev, struct device_attribute *attr, \
@@ -1235,16 +1077,6 @@ store_##reg(struct device *dev, struct device_attrib=
ute *attr, \
 store_temp_reg(reg_temp_over, temp_max);
 store_temp_reg(reg_temp_hyst, temp_max_hyst);
=20
-static ssize_t
-show_temp_offset(struct device *dev, struct device_attribute *attr, char *=
buf)
-{
-	struct w83627ehf_data *data =3D w83627ehf_update_device(dev);
-	struct sensor_device_attribute *sensor_attr =3D to_sensor_dev_attr(attr);
-
-	return sprintf(buf, "%d\n",
-		       data->temp_offset[sensor_attr->index] * 1000);
-}
-
 static ssize_t
 store_temp_offset(struct device *dev, struct device_attribute *attr,
 		  const char *buf, size_t count)
@@ -1268,117 +1100,6 @@ store_temp_offset(struct device *dev, struct device=
_attribute *attr,
 	return count;
 }
=20
-static ssize_t
-show_temp_type(struct device *dev, struct device_attribute *attr, char *bu=
f)
-{
-	struct w83627ehf_data *data =3D w83627ehf_update_device(dev);
-	struct sensor_device_attribute *sensor_attr =3D to_sensor_dev_attr(attr);
-	int nr =3D sensor_attr->index;
-	return sprintf(buf, "%d\n", (int)data->temp_type[nr]);
-}
-
-static struct sensor_device_attribute sda_temp_input[] =3D {
-	SENSOR_ATTR(temp1_input, S_IRUGO, show_temp, NULL, 0),
-	SENSOR_ATTR(temp2_input, S_IRUGO, show_temp, NULL, 1),
-	SENSOR_ATTR(temp3_input, S_IRUGO, show_temp, NULL, 2),
-	SENSOR_ATTR(temp4_input, S_IRUGO, show_temp, NULL, 3),
-	SENSOR_ATTR(temp5_input, S_IRUGO, show_temp, NULL, 4),
-	SENSOR_ATTR(temp6_input, S_IRUGO, show_temp, NULL, 5),
-	SENSOR_ATTR(temp7_input, S_IRUGO, show_temp, NULL, 6),
-	SENSOR_ATTR(temp8_input, S_IRUGO, show_temp, NULL, 7),
-	SENSOR_ATTR(temp9_input, S_IRUGO, show_temp, NULL, 8),
-};
-
-static struct sensor_device_attribute sda_temp_label[] =3D {
-	SENSOR_ATTR(temp1_label, S_IRUGO, show_temp_label, NULL, 0),
-	SENSOR_ATTR(temp2_label, S_IRUGO, show_temp_label, NULL, 1),
-	SENSOR_ATTR(temp3_label, S_IRUGO, show_temp_label, NULL, 2),
-	SENSOR_ATTR(temp4_label, S_IRUGO, show_temp_label, NULL, 3),
-	SENSOR_ATTR(temp5_label, S_IRUGO, show_temp_label, NULL, 4),
-	SENSOR_ATTR(temp6_label, S_IRUGO, show_temp_label, NULL, 5),
-	SENSOR_ATTR(temp7_label, S_IRUGO, show_temp_label, NULL, 6),
-	SENSOR_ATTR(temp8_label, S_IRUGO, show_temp_label, NULL, 7),
-	SENSOR_ATTR(temp9_label, S_IRUGO, show_temp_label, NULL, 8),
-};
-
-static struct sensor_device_attribute sda_temp_max[] =3D {
-	SENSOR_ATTR(temp1_max, S_IRUGO | S_IWUSR, show_temp_max,
-		    store_temp_max, 0),
-	SENSOR_ATTR(temp2_max, S_IRUGO | S_IWUSR, show_temp_max,
-		    store_temp_max, 1),
-	SENSOR_ATTR(temp3_max, S_IRUGO | S_IWUSR, show_temp_max,
-		    store_temp_max, 2),
-	SENSOR_ATTR(temp4_max, S_IRUGO | S_IWUSR, show_temp_max,
-		    store_temp_max, 3),
-	SENSOR_ATTR(temp5_max, S_IRUGO | S_IWUSR, show_temp_max,
-		    store_temp_max, 4),
-	SENSOR_ATTR(temp6_max, S_IRUGO | S_IWUSR, show_temp_max,
-		    store_temp_max, 5),
-	SENSOR_ATTR(temp7_max, S_IRUGO | S_IWUSR, show_temp_max,
-		    store_temp_max, 6),
-	SENSOR_ATTR(temp8_max, S_IRUGO | S_IWUSR, show_temp_max,
-		    store_temp_max, 7),
-	SENSOR_ATTR(temp9_max, S_IRUGO | S_IWUSR, show_temp_max,
-		    store_temp_max, 8),
-};
-
-static struct sensor_device_attribute sda_temp_max_hyst[] =3D {
-	SENSOR_ATTR(temp1_max_hyst, S_IRUGO | S_IWUSR, show_temp_max_hyst,
-		    store_temp_max_hyst, 0),
-	SENSOR_ATTR(temp2_max_hyst, S_IRUGO | S_IWUSR, show_temp_max_hyst,
-		    store_temp_max_hyst, 1),
-	SENSOR_ATTR(temp3_max_hyst, S_IRUGO | S_IWUSR, show_temp_max_hyst,
-		    store_temp_max_hyst, 2),
-	SENSOR_ATTR(temp4_max_hyst, S_IRUGO | S_IWUSR, show_temp_max_hyst,
-		    store_temp_max_hyst, 3),
-	SENSOR_ATTR(temp5_max_hyst, S_IRUGO | S_IWUSR, show_temp_max_hyst,
-		    store_temp_max_hyst, 4),
-	SENSOR_ATTR(temp6_max_hyst, S_IRUGO | S_IWUSR, show_temp_max_hyst,
-		    store_temp_max_hyst, 5),
-	SENSOR_ATTR(temp7_max_hyst, S_IRUGO | S_IWUSR, show_temp_max_hyst,
-		    store_temp_max_hyst, 6),
-	SENSOR_ATTR(temp8_max_hyst, S_IRUGO | S_IWUSR, show_temp_max_hyst,
-		    store_temp_max_hyst, 7),
-	SENSOR_ATTR(temp9_max_hyst, S_IRUGO | S_IWUSR, show_temp_max_hyst,
-		    store_temp_max_hyst, 8),
-};
-
-static struct sensor_device_attribute sda_temp_alarm[] =3D {
-	SENSOR_ATTR(temp1_alarm, S_IRUGO, show_alarm, NULL, 4),
-	SENSOR_ATTR(temp2_alarm, S_IRUGO, show_alarm, NULL, 5),
-	SENSOR_ATTR(temp3_alarm, S_IRUGO, show_alarm, NULL, 13),
-};
-
-static struct sensor_device_attribute sda_temp_type[] =3D {
-	SENSOR_ATTR(temp1_type, S_IRUGO, show_temp_type, NULL, 0),
-	SENSOR_ATTR(temp2_type, S_IRUGO, show_temp_type, NULL, 1),
-	SENSOR_ATTR(temp3_type, S_IRUGO, show_temp_type, NULL, 2),
-};
-
-static struct sensor_device_attribute sda_temp_offset[] =3D {
-	SENSOR_ATTR(temp1_offset, S_IRUGO | S_IWUSR, show_temp_offset,
-		    store_temp_offset, 0),
-	SENSOR_ATTR(temp2_offset, S_IRUGO | S_IWUSR, show_temp_offset,
-		    store_temp_offset, 1),
-	SENSOR_ATTR(temp3_offset, S_IRUGO | S_IWUSR, show_temp_offset,
-		    store_temp_offset, 2),
-};
-
-#define show_pwm_reg(reg) \
-static ssize_t show_##reg(struct device *dev, struct device_attribute *att=
r, \
-			  char *buf) \
-{ \
-	struct w83627ehf_data *data =3D w83627ehf_update_device(dev); \
-	struct sensor_device_attribute *sensor_attr =3D \
-		to_sensor_dev_attr(attr); \
-	int nr =3D sensor_attr->index; \
-	return sprintf(buf, "%d\n", data->reg[nr]); \
-}
-
-show_pwm_reg(pwm_mode)
-show_pwm_reg(pwm_enable)
-show_pwm_reg(pwm)
-
 static ssize_t
 store_pwm_mode(struct device *dev, struct device_attribute *attr,
 			const char *buf, size_t count)
@@ -1555,35 +1276,6 @@ store_tolerance(struct device *dev, struct device_at=
tribute *attr,
 	return count;
 }
=20
-static struct sensor_device_attribute sda_pwm[] =3D {
-	SENSOR_ATTR(pwm1, S_IWUSR | S_IRUGO, show_pwm, store_pwm, 0),
-	SENSOR_ATTR(pwm2, S_IWUSR | S_IRUGO, show_pwm, store_pwm, 1),
-	SENSOR_ATTR(pwm3, S_IWUSR | S_IRUGO, show_pwm, store_pwm, 2),
-	SENSOR_ATTR(pwm4, S_IWUSR | S_IRUGO, show_pwm, store_pwm, 3),
-};
-
-static struct sensor_device_attribute sda_pwm_mode[] =3D {
-	SENSOR_ATTR(pwm1_mode, S_IWUSR | S_IRUGO, show_pwm_mode,
-		    store_pwm_mode, 0),
-	SENSOR_ATTR(pwm2_mode, S_IWUSR | S_IRUGO, show_pwm_mode,
-		    store_pwm_mode, 1),
-	SENSOR_ATTR(pwm3_mode, S_IWUSR | S_IRUGO, show_pwm_mode,
-		    store_pwm_mode, 2),
-	SENSOR_ATTR(pwm4_mode, S_IWUSR | S_IRUGO, show_pwm_mode,
-		    store_pwm_mode, 3),
-};
-
-static struct sensor_device_attribute sda_pwm_enable[] =3D {
-	SENSOR_ATTR(pwm1_enable, S_IWUSR | S_IRUGO, show_pwm_enable,
-		    store_pwm_enable, 0),
-	SENSOR_ATTR(pwm2_enable, S_IWUSR | S_IRUGO, show_pwm_enable,
-		    store_pwm_enable, 1),
-	SENSOR_ATTR(pwm3_enable, S_IWUSR | S_IRUGO, show_pwm_enable,
-		    store_pwm_enable, 2),
-	SENSOR_ATTR(pwm4_enable, S_IWUSR | S_IRUGO, show_pwm_enable,
-		    store_pwm_enable, 3),
-};
-
 static struct sensor_device_attribute sda_target_temp[] =3D {
 	SENSOR_ATTR(pwm1_target, S_IWUSR | S_IRUGO, show_target_temp,
 		    store_target_temp, 0),
@@ -1745,6 +1437,7 @@ static struct sensor_device_attribute sda_sf3_max_ste=
p_arrays[] =3D {
 	SENSOR_ATTR(pwm3_step_output, S_IWUSR | S_IRUGO, show_fan_step_output,
 		    store_fan_step_output, 2),
 };
+#endif
=20
 static ssize_t
 cpu0_vid_show(struct device *dev, struct device_attribute *attr, char *buf)
@@ -1755,6 +1448,7 @@ cpu0_vid_show(struct device *dev, struct device_attri=
bute *attr, char *buf)
 static DEVICE_ATTR_RO(cpu0_vid);
=20
=20
+#if 0
 /* Case open detection */
=20
 static ssize_t
@@ -1795,77 +1489,12 @@ static struct sensor_device_attribute_2 sda_caseope=
n[] =3D {
 	SENSOR_ATTR_2(intrusion1_alarm, S_IWUSR | S_IRUGO, show_caseopen,
 			clear_caseopen, 0x40, 0x40),
 };
+#endif
=20
 /*
  * Driver and device management
  */
=20
-static void w83627ehf_device_remove_files(struct device *dev)
-{
-	/*
-	 * some entries in the following arrays may not have been used in
-	 * device_create_file(), but device_remove_file() will ignore them
-	 */
-	int i;
-	struct w83627ehf_data *data =3D dev_get_drvdata(dev);
-
-	for (i =3D 0; i < ARRAY_SIZE(sda_sf3_arrays); i++)
-		device_remove_file(dev, &sda_sf3_arrays[i].dev_attr);
-	for (i =3D 0; i < ARRAY_SIZE(sda_sf3_max_step_arrays); i++) {
-		struct sensor_device_attribute *attr =3D
-		  &sda_sf3_max_step_arrays[i];
-		if (data->REG_FAN_STEP_OUTPUT &&
-		    data->REG_FAN_STEP_OUTPUT[attr->index] !=3D 0xff)
-			device_remove_file(dev, &attr->dev_attr);
-	}
-	for (i =3D 0; i < ARRAY_SIZE(sda_sf3_arrays_fan3); i++)
-		device_remove_file(dev, &sda_sf3_arrays_fan3[i].dev_attr);
-	for (i =3D 0; i < ARRAY_SIZE(sda_sf3_arrays_fan4); i++)
-		device_remove_file(dev, &sda_sf3_arrays_fan4[i].dev_attr);
-	for (i =3D 0; i < data->in_num; i++) {
-		if ((i =3D=3D 6) && data->in6_skip)
-			continue;
-		device_remove_file(dev, &sda_in_input[i].dev_attr);
-		device_remove_file(dev, &sda_in_alarm[i].dev_attr);
-		device_remove_file(dev, &sda_in_min[i].dev_attr);
-		device_remove_file(dev, &sda_in_max[i].dev_attr);
-	}
-	for (i =3D 0; i < 5; i++) {
-		device_remove_file(dev, &sda_fan_input[i].dev_attr);
-		device_remove_file(dev, &sda_fan_alarm[i].dev_attr);
-		device_remove_file(dev, &sda_fan_div[i].dev_attr);
-		device_remove_file(dev, &sda_fan_min[i].dev_attr);
-	}
-	for (i =3D 0; i < data->pwm_num; i++) {
-		device_remove_file(dev, &sda_pwm[i].dev_attr);
-		device_remove_file(dev, &sda_pwm_mode[i].dev_attr);
-		device_remove_file(dev, &sda_pwm_enable[i].dev_attr);
-		device_remove_file(dev, &sda_target_temp[i].dev_attr);
-		device_remove_file(dev, &sda_tolerance[i].dev_attr);
-	}
-	for (i =3D 0; i < NUM_REG_TEMP; i++) {
-		if (!(data->have_temp & (1 << i)))
-			continue;
-		device_remove_file(dev, &sda_temp_input[i].dev_attr);
-		device_remove_file(dev, &sda_temp_label[i].dev_attr);
-		if (i =3D=3D 2 && data->temp3_val_only)
-			continue;
-		device_remove_file(dev, &sda_temp_max[i].dev_attr);
-		device_remove_file(dev, &sda_temp_max_hyst[i].dev_attr);
-		if (i > 2)
-			continue;
-		device_remove_file(dev, &sda_temp_alarm[i].dev_attr);
-		device_remove_file(dev, &sda_temp_type[i].dev_attr);
-		device_remove_file(dev, &sda_temp_offset[i].dev_attr);
-	}
-
-	device_remove_file(dev, &sda_caseopen[0].dev_attr);
-	device_remove_file(dev, &sda_caseopen[1].dev_attr);
-
-	device_remove_file(dev, &dev_attr_name);
-	device_remove_file(dev, &dev_attr_cpu0_vid);
-}
-
 /* Get the monitoring functions started */
 static inline void w83627ehf_init_device(struct w83627ehf_data *data,
 						   enum kinds kind)
@@ -2035,6 +1664,327 @@ w83627ehf_check_fan_inputs(const struct w83627ehf_s=
io_data *sio_data,
 	}
 }
=20
+static umode_t
+w83627ehf_is_visible(const void *drvdata, enum hwmon_sensor_types type,
+		     u32 attr, int channel)
+{
+	const struct w83627ehf_data *data =3D drvdata;
+	bool is_writable =3D false;
+
+	switch (type) {
+	case hwmon_temp:
+		/* channel 0.., name 1.. */
+		if (!(data->have_temp & (1 << channel)))
+			return 0;
+		if (attr =3D=3D hwmon_temp_input || attr =3D=3D hwmon_temp_label)
+			return S_IRUGO;
+		if (channel =3D=3D 2 && data->temp3_val_only)
+			return 0;
+		if (attr =3D=3D hwmon_temp_max) {
+			if (data->reg_temp_over[channel])
+				return S_IRUGO | S_IWUSR;
+			else
+				return 0;
+		}
+		if (attr =3D=3D hwmon_temp_max_hyst) {
+			if (data->reg_temp_hyst[channel])
+				return S_IRUGO | S_IWUSR;
+			else
+				return 0;
+		}
+		if (channel > 2)
+			return 0;
+		if (attr =3D=3D hwmon_temp_alarm || attr =3D=3D hwmon_temp_type)
+			return S_IRUGO;
+		if (attr =3D=3D hwmon_temp_offset) {
+			if (data->have_temp_offset & (1 << channel))
+				return S_IRUGO | S_IWUSR;
+			else
+				return 0;
+		}
+		break;
+
+	case hwmon_fan:
+		/* channel 0.., name 1.. */
+		if (!(data->has_fan & (1 << channel)))
+			return 0;
+		if (attr =3D=3D hwmon_fan_input || attr =3D=3D hwmon_fan_alarm)
+			return S_IRUGO;
+		if (attr =3D=3D hwmon_fan_div) {
+			if (data->kind !=3D nct6776)
+				return S_IRUGO;
+			else
+				return 0;
+		}
+		if (attr =3D=3D hwmon_fan_min) {
+			if (data->has_fan_min & (1 << channel))
+				return S_IRUGO | S_IWUSR;
+			else
+				return 0;
+		}
+		break;
+
+	case hwmon_in:
+		/* channel 0.., name 0.. */
+		if (channel >=3D data->in_num)
+			return 0;
+		if (channel =3D=3D 6 && data->in6_skip)
+			return 0;
+		if (attr =3D=3D hwmon_in_alarm || attr =3D=3D hwmon_in_input)
+			return S_IRUGO;
+		if (attr =3D=3D hwmon_in_min || attr =3D=3D hwmon_in_max)
+			return S_IRUGO | S_IWUSR;
+		break;
+
+	case hwmon_pwm:
+		/* channel 0.., name 1.. */
+		if (!(data->has_fan & (1 << channel)) ||
+		    channel >=3D data->pwm_num)
+			return 0;
+		if (attr =3D=3D hwmon_pwm_mode || attr =3D=3D hwmon_pwm_enable ||
+		    attr =3D=3D hwmon_pwm_input)
+			return S_IRUGO | S_IWUSR;
+		/* TODO: More pwm entries */
+
+		break;
+
+	/* TODO: intrusion */
+
+	default: /* Shouldn't happen */
+		return 0;
+	}
+
+	return S_IRUGO | (is_writable ? S_IWUSR : 0);
+}
+
+static int
+w83627ehf_do_read_temp(struct w83627ehf_data *data, u32 attr,
+		       int channel, long *val)
+{
+	switch (attr) {
+	case hwmon_temp_input:
+		*val =3D LM75_TEMP_FROM_REG(data->temp[channel]);
+		return 0;
+	case hwmon_temp_max:
+		*val =3D LM75_TEMP_FROM_REG(data->temp_max[channel]);
+		return 0;
+	case hwmon_temp_max_hyst:
+		*val =3D LM75_TEMP_FROM_REG(data->temp_max_hyst[channel]);
+		return 0;
+	case hwmon_temp_offset:
+		*val =3D data->temp_offset[channel] * 1000;
+		return 0;
+	case hwmon_temp_type:
+		*val =3D (int)data->temp_type[channel];
+		return 0;
+	case hwmon_temp_alarm:
+		if (channel < 3) {
+			int bit[] =3D { 4, 5, 13 };
+			*val =3D (data->alarms >> bit[channel]) & 1;
+			return 0;
+		}
+		break;
+
+	default:
+		break;
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static int
+w83627ehf_do_read_in(struct w83627ehf_data *data, u32 attr,
+		     int channel, long *val)
+{
+	switch (attr) {
+	case hwmon_in_input:
+		*val =3D in_from_reg(data->in[channel], channel, data->scale_in);
+		return 0;
+	case hwmon_in_min:
+		*val =3D in_from_reg(data->in_min[channel], channel,
+				   data->scale_in);
+		return 0;
+	case hwmon_in_max:
+		*val =3D in_from_reg(data->in_max[channel], channel,
+				   data->scale_in);
+		return 0;
+	case hwmon_in_alarm:
+		if (channel < 10) {
+			int bit[] =3D { 0, 1, 2, 3, 8, 21, 20, 16, 17, 19 };
+			*val =3D (data->alarms >> bit[channel]) & 1;
+			return 0;
+		}
+		break;
+	default:
+		break;
+	}
+	return -EOPNOTSUPP;
+}
+
+static int
+w83627ehf_do_read_fan(struct w83627ehf_data *data, u32 attr,
+		      int channel, long *val)
+{
+	switch (attr) {
+	case hwmon_fan_input:
+		*val =3D data->rpm[channel];
+		return 0;
+	case hwmon_fan_min:
+		*val =3D data->fan_from_reg_min(data->fan_min[channel],
+					      data->fan_div[channel]);
+		return 0;
+	case hwmon_fan_div:
+		*val =3D div_from_reg(data->fan_div[channel]);
+		return 0;
+	case hwmon_fan_alarm:
+		if (channel < 5) {
+			int bit[] =3D { 6, 7, 11, 10, 23 };
+			*val =3D (data->alarms >> bit[channel]) & 1;
+			return 0;
+		}
+		break;
+	default:
+		break;
+	}
+	return -EOPNOTSUPP;
+}
+
+static int
+w83627ehf_do_read_pwm(struct w83627ehf_data *data, u32 attr,
+		      int channel, long *val)
+{
+	switch (attr) {
+	case hwmon_pwm_input:
+		*val =3D data->pwm[channel];
+		return 0;
+	case hwmon_pwm_enable:
+		*val =3D data->pwm_enable[channel];
+		return 0;
+	case hwmon_pwm_mode:
+		*val =3D data->pwm_enable[channel];
+		return 0;
+	/* TODO: Other PWM entries */
+	default:
+		break;
+	}
+	return -EOPNOTSUPP;
+}
+static int
+w83627ehf_read(struct device *dev, enum hwmon_sensor_types type,
+			u32 attr, int channel, long *val)
+{
+	struct w83627ehf_data *data =3D w83627ehf_update_device(dev->parent);
+
+	switch (type) {
+	case hwmon_fan:
+		return w83627ehf_do_read_fan(data, attr, channel, val);
+
+	case hwmon_in:
+		return w83627ehf_do_read_in(data, attr, channel, val);
+
+	case hwmon_pwm:
+		return w83627ehf_do_read_pwm(data, attr, channel, val);
+
+	case hwmon_temp:
+		return w83627ehf_do_read_temp(data, attr, channel, val);
+
+	/* TODO: Intrusion */
+	default:
+		break;
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static int
+w83627ehf_read_string(struct device *dev, enum hwmon_sensor_types type,
+		      u32 attr, int channel, const char **str)
+{
+	struct w83627ehf_data *data =3D dev_get_drvdata(dev);
+
+	switch (type) {
+	case hwmon_temp:
+		if (attr =3D=3D hwmon_temp_label) {
+			*str =3D data->temp_label[data->temp_src[channel]];
+			return 0;
+		}
+		break;
+
+	default:
+		break;
+	}
+	/* Nothing else should be read as a string */
+	return -EOPNOTSUPP;
+}
+
+static int
+w83627ehf_write(struct device *dev, enum hwmon_sensor_types type,
+			u32 attr, int channel, long val)
+{
+	return -EOPNOTSUPP; /* TODO */
+}
+
+static const struct hwmon_ops w83627ehf_ops =3D {
+	.is_visible =3D w83627ehf_is_visible,
+	.read =3D w83627ehf_read,
+	.read_string =3D w83627ehf_read_string,
+	.write =3D w83627ehf_write,
+};
+
+static const struct hwmon_channel_info *w83627ehf_info[] =3D {
+	HWMON_CHANNEL_INFO(fan,
+		HWMON_F_ALARM | HWMON_F_DIV | HWMON_F_INPUT | HWMON_F_MIN,
+		HWMON_F_ALARM | HWMON_F_DIV | HWMON_F_INPUT | HWMON_F_MIN,
+		HWMON_F_ALARM | HWMON_F_DIV | HWMON_F_INPUT | HWMON_F_MIN,
+		HWMON_F_ALARM | HWMON_F_DIV | HWMON_F_INPUT | HWMON_F_MIN,
+		HWMON_F_ALARM | HWMON_F_DIV | HWMON_F_INPUT | HWMON_F_MIN),
+	HWMON_CHANNEL_INFO(in,
+		HWMON_I_ALARM | HWMON_I_INPUT | HWMON_I_MAX | HWMON_I_MIN,
+		HWMON_I_ALARM | HWMON_I_INPUT | HWMON_I_MAX | HWMON_I_MIN,
+		HWMON_I_ALARM | HWMON_I_INPUT | HWMON_I_MAX | HWMON_I_MIN,
+		HWMON_I_ALARM | HWMON_I_INPUT | HWMON_I_MAX | HWMON_I_MIN,
+		HWMON_I_ALARM | HWMON_I_INPUT | HWMON_I_MAX | HWMON_I_MIN,
+		HWMON_I_ALARM | HWMON_I_INPUT | HWMON_I_MAX | HWMON_I_MIN,
+		HWMON_I_ALARM | HWMON_I_INPUT | HWMON_I_MAX | HWMON_I_MIN,
+		HWMON_I_ALARM | HWMON_I_INPUT | HWMON_I_MAX | HWMON_I_MIN,
+		HWMON_I_ALARM | HWMON_I_INPUT | HWMON_I_MAX | HWMON_I_MIN,
+		HWMON_I_ALARM | HWMON_I_INPUT | HWMON_I_MAX | HWMON_I_MIN),
+	/* TODO: intrusion%d_alarm */
+	/* TODO: We've also got {max|start|step|stop}_output, stop_time, target
+	 * and tolerance
+	 */
+	HWMON_CHANNEL_INFO(pwm,
+		HWMON_PWM_ENABLE | HWMON_PWM_INPUT | HWMON_PWM_MODE,
+		HWMON_PWM_ENABLE | HWMON_PWM_INPUT | HWMON_PWM_MODE,
+		HWMON_PWM_ENABLE | HWMON_PWM_INPUT | HWMON_PWM_MODE,
+		HWMON_PWM_ENABLE | HWMON_PWM_INPUT | HWMON_PWM_MODE),
+	HWMON_CHANNEL_INFO(temp,
+		HWMON_T_ALARM | HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MAX |
+			HWMON_T_MAX_HYST | HWMON_T_OFFSET | HWMON_T_TYPE,
+		HWMON_T_ALARM | HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MAX |
+			HWMON_T_MAX_HYST | HWMON_T_OFFSET | HWMON_T_TYPE,
+		HWMON_T_ALARM | HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MAX |
+			HWMON_T_MAX_HYST | HWMON_T_OFFSET | HWMON_T_TYPE,
+		HWMON_T_ALARM | HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MAX |
+			HWMON_T_MAX_HYST | HWMON_T_OFFSET | HWMON_T_TYPE,
+		HWMON_T_ALARM | HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MAX |
+			HWMON_T_MAX_HYST | HWMON_T_OFFSET | HWMON_T_TYPE,
+		HWMON_T_ALARM | HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MAX |
+			HWMON_T_MAX_HYST | HWMON_T_OFFSET | HWMON_T_TYPE,
+		HWMON_T_ALARM | HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MAX |
+			HWMON_T_MAX_HYST | HWMON_T_OFFSET | HWMON_T_TYPE,
+		HWMON_T_ALARM | HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MAX |
+			HWMON_T_MAX_HYST | HWMON_T_OFFSET | HWMON_T_TYPE,
+		HWMON_T_ALARM | HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MAX |
+			HWMON_T_MAX_HYST | HWMON_T_OFFSET | HWMON_T_TYPE),
+	NULL
+};
+
+static const struct hwmon_chip_info w83627ehf_chip_info =3D {
+	.ops =3D &w83627ehf_ops,
+	.info =3D w83627ehf_info,
+};
+
 static int w83627ehf_probe(struct platform_device *pdev)
 {
 	struct device *dev =3D &pdev->dev;
@@ -2043,6 +1993,7 @@ static int w83627ehf_probe(struct platform_device *pd=
ev)
 	struct resource *res;
 	u8 en_vrm10;
 	int i, err =3D 0;
+	struct device *hwmon_dev;
=20
 	res =3D platform_get_resource(pdev, IORESOURCE_IO, 0);
 	if (!request_region(res->start, IOREGION_LENGTH, DRVNAME)) {
@@ -2064,6 +2015,7 @@ static int w83627ehf_probe(struct platform_device *pd=
ev)
 	mutex_init(&data->lock);
 	mutex_init(&data->update_lock);
 	data->name =3D w83627ehf_device_names[sio_data->kind];
+	data->kind =3D sio_data->kind;
 	data->bank =3D 0xff;		/* Force initial bank selection */
 	platform_set_drvdata(pdev, data);
=20
@@ -2433,6 +2385,7 @@ static int w83627ehf_probe(struct platform_device *pd=
ev)
 	for (i =3D 0; i < data->pwm_num; i++)
 		data->pwm_enable_orig[i] =3D data->pwm_enable[i];
=20
+#if 0 /* DAG REMOVE! */
 	/* Register sysfs hooks */
 	for (i =3D 0; i < ARRAY_SIZE(sda_sf3_arrays); i++) {
 		err =3D device_create_file(dev, &sda_sf3_arrays[i].dev_attr);
@@ -2466,45 +2419,10 @@ static int w83627ehf_probe(struct platform_device *=
pdev)
 				goto exit_remove;
 		}
=20
-	for (i =3D 0; i < data->in_num; i++) {
-		if ((i =3D=3D 6) && data->in6_skip)
-			continue;
-		if ((err =3D device_create_file(dev, &sda_in_input[i].dev_attr))
-			|| (err =3D device_create_file(dev,
-				&sda_in_alarm[i].dev_attr))
-			|| (err =3D device_create_file(dev,
-				&sda_in_min[i].dev_attr))
-			|| (err =3D device_create_file(dev,
-				&sda_in_max[i].dev_attr)))
-			goto exit_remove;
-	}
-
 	for (i =3D 0; i < 5; i++) {
 		if (data->has_fan & (1 << i)) {
-			if ((err =3D device_create_file(dev,
-					&sda_fan_input[i].dev_attr))
-				|| (err =3D device_create_file(dev,
-					&sda_fan_alarm[i].dev_attr)))
-				goto exit_remove;
-			if (sio_data->kind !=3D nct6776) {
-				err =3D device_create_file(dev,
-						&sda_fan_div[i].dev_attr);
-				if (err)
-					goto exit_remove;
-			}
-			if (data->has_fan_min & (1 << i)) {
-				err =3D device_create_file(dev,
-						&sda_fan_min[i].dev_attr);
-				if (err)
-					goto exit_remove;
-			}
 			if (i < data->pwm_num &&
-				((err =3D device_create_file(dev,
-					&sda_pwm[i].dev_attr))
-				|| (err =3D device_create_file(dev,
-					&sda_pwm_mode[i].dev_attr))
-				|| (err =3D device_create_file(dev,
-					&sda_pwm_enable[i].dev_attr))
+	        TODO - dag - more pwm
 				|| (err =3D device_create_file(dev,
 					&sda_target_temp[i].dev_attr))
 				|| (err =3D device_create_file(dev,
@@ -2513,47 +2431,6 @@ static int w83627ehf_probe(struct platform_device *p=
dev)
 		}
 	}
=20
-	for (i =3D 0; i < NUM_REG_TEMP; i++) {
-		if (!(data->have_temp & (1 << i)))
-			continue;
-		err =3D device_create_file(dev, &sda_temp_input[i].dev_attr);
-		if (err)
-			goto exit_remove;
-		if (data->temp_label) {
-			err =3D device_create_file(dev,
-						 &sda_temp_label[i].dev_attr);
-			if (err)
-				goto exit_remove;
-		}
-		if (i =3D=3D 2 && data->temp3_val_only)
-			continue;
-		if (data->reg_temp_over[i]) {
-			err =3D device_create_file(dev,
-				&sda_temp_max[i].dev_attr);
-			if (err)
-				goto exit_remove;
-		}
-		if (data->reg_temp_hyst[i]) {
-			err =3D device_create_file(dev,
-				&sda_temp_max_hyst[i].dev_attr);
-			if (err)
-				goto exit_remove;
-		}
-		if (i > 2)
-			continue;
-		if ((err =3D device_create_file(dev,
-				&sda_temp_alarm[i].dev_attr))
-			|| (err =3D device_create_file(dev,
-				&sda_temp_type[i].dev_attr)))
-			goto exit_remove;
-		if (data->have_temp_offset & (1 << i)) {
-			err =3D device_create_file(dev,
-						 &sda_temp_offset[i].dev_attr);
-			if (err)
-				goto exit_remove;
-		}
-	}
-
 	err =3D device_create_file(dev, &sda_caseopen[0].dev_attr);
 	if (err)
 		goto exit_remove;
@@ -2567,17 +2444,16 @@ static int w83627ehf_probe(struct platform_device *=
pdev)
 	err =3D device_create_file(dev, &dev_attr_name);
 	if (err)
 		goto exit_remove;
+#endif
=20
-	data->hwmon_dev =3D hwmon_device_register(dev);
-	if (IS_ERR(data->hwmon_dev)) {
-		err =3D PTR_ERR(data->hwmon_dev);
-		goto exit_remove;
-	}
+	hwmon_dev =3D devm_hwmon_device_register_with_info(&pdev->dev,
+							 data->name,
+							 data,
+							 &w83627ehf_chip_info,
+							 NULL);
=20
-	return 0;
+	return PTR_ERR_OR_ZERO(hwmon_dev);
=20
-exit_remove:
-	w83627ehf_device_remove_files(dev);
 exit_release:
 	release_region(res->start, IOREGION_LENGTH);
 exit:
@@ -2588,8 +2464,6 @@ static int w83627ehf_remove(struct platform_device *p=
dev)
 {
 	struct w83627ehf_data *data =3D platform_get_drvdata(pdev);
=20
-	hwmon_device_unregister(data->hwmon_dev);
-	w83627ehf_device_remove_files(&pdev->dev);
 	release_region(data->addr, IOREGION_LENGTH);
=20
 	return 0;
--=20
2.23.0

