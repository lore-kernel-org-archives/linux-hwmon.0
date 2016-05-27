Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from basicbox7.server-home.net ([195.137.212.29]:40969 "EHLO
	basicbox7.server-home.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750828AbcE0NF6 (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Fri, 27 May 2016 09:05:58 -0400
Subject: Re: [PATCH] dell-smm-hwmon: Cache fan_type() calls and use
 fan_status() for fan detection
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
References: <1463842001-17785-1-git-send-email-pali.rohar@gmail.com>
 <20160527094736.GL29844@pali>
 <10b66444-9405-9d4c-b1ec-ce57f7e8420f@leemhuis.info>
 <201605271245.47383@pali>
Cc: Jan C Peters <jcpeters89@gmail.com>,
	=?UTF-8?Q?David_Santamar=c3=ada_Rogado?= <howl.nsp@gmail.com>,
	Peter Saunderson <peteasa@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Tolga Cakir <cevelnet@gmail.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
From: Thorsten Leemhuis <fedora@leemhuis.info>
Message-ID: <01084692-618a-31db-76f8-60176d1cd2cc@leemhuis.info>
Date: Fri, 27 May 2016 15:05:54 +0200
MIME-Version: 1.0
In-Reply-To: <201605271245.47383@pali>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Pali Rohár wrote on 27.05.2016 12:45:
> […]
> Looks like there are two different problems with dell-smm-hwmon driver:
> 1) Fan speed going randomly up and down without system freeze
> […]
> So for problem 1) I need to know:
> 
> * Is it regression? […]

Yes, it is known to be a regression from f989e55452, as identified
by Jan in https://bugzilla.kernel.org/show_bug.cgi?id=100121#c13
 
I just verified and reverted that change on top of 4.6; the
problem with the fan speed indeed goes away. So I tried a few things
and came to the conclusion: the problem shows up as soon as 
i8k_get_fan_type() (introduced in f989e55452) is called somewhere.
Find below the minimal patch I could come up to that makes the fan
act normal on the Studio 8000 I have here (it's just meant as a 
reference and not meant to be applied, as it leaves unused functions 
around).

CU, knurd



--- dell-smm-hwmon.c-unmodified	2016-05-27 13:05:58.441654144 +0200
+++ dell-smm-hwmon.c	2016-05-27 14:49:31.896224380 +0200
@@ -686,14 +686,10 @@
 static SENSOR_DEVICE_ATTR(temp4_label, S_IRUGO, i8k_hwmon_show_temp_label, NULL,
 			  3);
 static SENSOR_DEVICE_ATTR(fan1_input, S_IRUGO, i8k_hwmon_show_fan, NULL, 0);
-static SENSOR_DEVICE_ATTR(fan1_label, S_IRUGO, i8k_hwmon_show_fan_label, NULL,
-			  0);
 static SENSOR_DEVICE_ATTR(pwm1, S_IRUGO | S_IWUSR, i8k_hwmon_show_pwm,
 			  i8k_hwmon_set_pwm, 0);
 static SENSOR_DEVICE_ATTR(fan2_input, S_IRUGO, i8k_hwmon_show_fan, NULL,
 			  1);
-static SENSOR_DEVICE_ATTR(fan2_label, S_IRUGO, i8k_hwmon_show_fan_label, NULL,
-			  1);
 static SENSOR_DEVICE_ATTR(pwm2, S_IRUGO | S_IWUSR, i8k_hwmon_show_pwm,
 			  i8k_hwmon_set_pwm, 1);
 
@@ -707,11 +703,9 @@
 	&sensor_dev_attr_temp4_input.dev_attr.attr,	/* 6 */
 	&sensor_dev_attr_temp4_label.dev_attr.attr,	/* 7 */
 	&sensor_dev_attr_fan1_input.dev_attr.attr,	/* 8 */
-	&sensor_dev_attr_fan1_label.dev_attr.attr,	/* 9 */
-	&sensor_dev_attr_pwm1.dev_attr.attr,		/* 10 */
-	&sensor_dev_attr_fan2_input.dev_attr.attr,	/* 11 */
-	&sensor_dev_attr_fan2_label.dev_attr.attr,	/* 12 */
-	&sensor_dev_attr_pwm2.dev_attr.attr,		/* 13 */
+	&sensor_dev_attr_pwm1.dev_attr.attr,		/* 9 */
+	&sensor_dev_attr_fan2_input.dev_attr.attr,	/* 10 */
+	&sensor_dev_attr_pwm2.dev_attr.attr,		/* 11 */
 	NULL
 };
 
@@ -730,10 +724,10 @@
 	if (index >= 6 && index <= 7 &&
 	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP4))
 		return 0;
-	if (index >= 8 && index <= 10 &&
+	if (index >= 8 && index <= 9 &&
 	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_FAN1))
 		return 0;
-	if (index >= 11 && index <= 13 &&
+	if (index >= 10 && index <= 11 &&
 	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_FAN2))
 		return 0;
 
@@ -768,12 +762,14 @@
 		i8k_hwmon_flags |= I8K_HWMON_HAVE_TEMP4;
 
 	/* First fan attributes, if fan type is OK */
-	err = i8k_get_fan_type(0);
+	// err = i8k_get_fan_type(0);
+	err = i8k_get_fan_status(0);
 	if (err >= 0)
 		i8k_hwmon_flags |= I8K_HWMON_HAVE_FAN1;
 
 	/* Second fan attributes, if fan type is OK */
-	err = i8k_get_fan_type(1);
+	// err = i8k_get_fan_type(1);
+	err = i8k_get_fan_status(1);
 	if (err >= 0)
 		i8k_hwmon_flags |= I8K_HWMON_HAVE_FAN2;
 
@@ -932,17 +928,6 @@
 static struct dmi_system_id i8k_blacklist_dmi_table[] __initdata = {
 	{
 		/*
-		 * CPU fan speed going up and down on Dell Studio XPS 8000
-		 * for unknown reasons.
-		 */
-		.ident = "Dell Studio XPS 8000",
-		.matches = {
-			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Studio XPS 8000"),
-		},
-	},
-	{
-		/*
 		 * CPU fan speed going up and down on Dell Studio XPS 8100
 		 * for unknown reasons.
 		 */
