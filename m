Return-Path: <SRS0=sw0Y=ZV=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38D2CC432C0
	for <linux-hwmon@archiver.kernel.org>; Fri, 29 Nov 2019 17:54:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E1BE52158A
	for <linux-hwmon@archiver.kernel.org>; Fri, 29 Nov 2019 17:54:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rujS4wz5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726971AbfK2Ry0 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 29 Nov 2019 12:54:26 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:36402 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726909AbfK2Ry0 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 29 Nov 2019 12:54:26 -0500
Received: by mail-ot1-f66.google.com with SMTP id d7so8583969otq.3
        for <linux-hwmon@vger.kernel.org>; Fri, 29 Nov 2019 09:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:resent-from:resent-date:resent-message-id:resent-to
         :envelope-to:delivery-date:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:accept-language:content-language
         :user-agent:content-id:content-transfer-encoding:mime-version;
        bh=6T+3k/zhPMyu1AsbAWKxzpmYwv6XNTFvM696gKdi9h4=;
        b=rujS4wz5jPp7aLtzCtcXF8XXy5BPSPdj1lLrqAvPnt/M2wN8ENf8LyWJYnpPyziWiB
         vuw3r9nFvsYVqie9gEiL+ix3KRhxwdaWnMCLKfKzOA4G4Sb/MhGTf/ibgSWe6wugESE+
         c/FGlsRfpv49+Ru2dwJWdnaOG0r8i4fBlcBTOWye8stf663X6VwNQQQ/GHwe0cXvgWpM
         1q4WizoM5KcPXViokbhWcuZBMuXY2uKTnsfhFA211FtZp2T4LMn1AOowC0RoTM+juuil
         7U/CVSSflJyu9nmeFHOrXoA6jSZ9KPHLgW1lnDQWE+thm6f+yiJLAgEah5c8+d28TU3W
         RDfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:resent-from:resent-date:resent-message-id
         :resent-to:envelope-to:delivery-date:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:accept-language:content-language
         :user-agent:content-id:content-transfer-encoding:mime-version;
        bh=6T+3k/zhPMyu1AsbAWKxzpmYwv6XNTFvM696gKdi9h4=;
        b=W/ARgVZLGvmt+yR5RvOmL+IIZilnIRU8bHVy4S3OHA3BZ46GmoGRvXG5ajelPBwS9E
         0LBbAtD1A4L0cqpBg3Rx9BD+Rg5jTl+Epf+jUT4RChWJJitsywlYNAbwPXsRni3DcP60
         9MGVu9lKapNML67sTHh2JBnJTnmavuXdp3fNVA88STFu+CEKCSItNlLFUVXGmpOQ0xWg
         Tr1Um72v1I9t/ncbXeqTvJoFVgbVXH+T9uSIDXFWNF7Qkhov+tg60MmbKTFP2yPYVRfJ
         VLea5bGWnj2jOguCYY6AavOXCJj0ECIBIDl11nKMyUnMxPRpyDGJ4359po9J+l4VTsjK
         GSOg==
X-Gm-Message-State: APjAAAVzksVyRliwetlehQhV776LnR60iN5LpMw99E8RRq3Eo13TNxJD
        Z1Paf06pRMUCxAojh8nZVQ6x/Kju
X-Google-Smtp-Source: APXvYqx4mkLGRxKlE7UXg++HHFRNthcCHLxxQ2wlNDl+2QpVnt5u3h7go94uCzeB5QqVwn9iVIWRdg==
X-Received: by 2002:a05:6830:1051:: with SMTP id b17mr4771557otp.227.1575050064775;
        Fri, 29 Nov 2019 09:54:24 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h39sm7622688oth.9.2019.11.29.09.54.24
        for <linux-hwmon@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Nov 2019 09:54:24 -0800 (PST)
Received: from bh-25.webhostbox.net
        by bh-25.webhostbox.net with LMTP
        id aGrZNXr14F2IRQsAh82d6A
        (envelope-from <gilles.buloz@kontron.com>)
        for <linux@roeck-us.net>; Fri, 29 Nov 2019 10:39:54 +0000
Envelope-to: linux@roeck-us.net
Delivery-date: Fri, 29 Nov 2019 10:39:54 +0000
Received: from skedge04.snt-world.com ([91.208.41.69]:34122)
        by bh-25.webhostbox.net with esmtps (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.92)
        (envelope-from <gilles.buloz@kontron.com>)
        id 1iadgh-0039w6-2v
        for linux@roeck-us.net; Fri, 29 Nov 2019 10:39:54 +0000
Received: from sntmail14r.snt-is.com (unknown [10.203.32.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by skedge04.snt-world.com (Postfix) with ESMTPS id 0A4F967A08B
        for <linux@roeck-us.net>; Fri, 29 Nov 2019 11:39:35 +0100 (CET)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail14r.snt-is.com
 (10.203.32.184) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 29 Nov
 2019 11:39:34 +0100
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1713.004; Fri, 29 Nov 2019 11:39:34 +0100
From:   Gilles Buloz <Gilles.Buloz@kontron.com>
To:     "linux@roeck-us.net" <linux@roeck-us.net>
CC:     Gilles Buloz <Gilles.Buloz@kontron.com>
Subject: [PATCH 2/2] hwmon: (nct7802) Fix non-working alarm on voltages
Thread-Topic: [PATCH 2/2] hwmon: (nct7802) Fix non-working alarm on voltages
Thread-Index: AQHVpqFKxcR1fWMFwE6M2gw4QTx4hA==
Date:   Fri, 29 Nov 2019 10:39:34 +0000
Message-ID: <5de0f566.tBga5POKAgHlmd0p%gilles.buloz@kontron.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Heirloom mailx 12.4 7/29/08
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-Type: text/plain; charset="us-ascii"
Content-ID: <17BD850A68521C409860C1963B93C143@snt-world.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: 0A4F967A08B.A0EE8
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: gilles.buloz@kontron.com
X-SnT-MailScanner-To: linux@roeck-us.net
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Gilles Buloz <gilles.buloz@kontron.com>
Date: Fri, 29 Nov 2019 10:56:05 +0100
Subject: [PATCH 2/2] hwmon: (nct7802) Fix non-working alarm on voltages

No alarm is reported by /sys/.../inX_alarm

In detail:

The SMI Voltage status register is the only register giving a status
for voltages, but it does not work like the non-SMI status registers
used for temperatures and fans.
A bit is set for each input crossing a threshold, in both direction,
but the "inside" or "outside" limits info is not available.
Also this register is cleared on read.
Note : this is not explicitly spelled out in the datasheet, but from
experiment.
As a result if an input is crossing a threshold (min or max in any
direction), the alarm is reported only once even if the input is
still outside limits. Also if the alarm for another input is read
before the one of this input, no alarm is reported at all.

Signed-off-by: Gilles Buloz <gilles.buloz@kontron.com>
---
 drivers/hwmon/nct7802.c | 71 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 67 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/nct7802.c b/drivers/hwmon/nct7802.c
index 7915c2f2c85d..35fb352d5a52 100644
--- a/drivers/hwmon/nct7802.c
+++ b/drivers/hwmon/nct7802.c
@@ -58,6 +58,8 @@ static const u8 REG_VOLTAGE_LIMIT_MSB_SHIFT[2][5] =3D {
 struct nct7802_data {
 	struct regmap *regmap;
 	struct mutex access_lock; /* for multi-byte read and write operations */
+	u8 in_status;
+	struct mutex in_alarm_lock;
 };
=20
 static ssize_t temp_type_show(struct device *dev,
@@ -368,6 +370,66 @@ static ssize_t in_store(struct device *dev, struct dev=
ice_attribute *attr,
 	return err ? : count;
 }
=20
+static ssize_t in_alarm_show(struct device *dev, struct device_attribute *=
attr,
+			     char *buf)
+{
+	struct sensor_device_attribute_2 *sattr =3D to_sensor_dev_attr_2(attr);
+	struct nct7802_data *data =3D dev_get_drvdata(dev);
+	int volt, min, max, ret;
+	unsigned int val;
+
+	mutex_lock(&data->in_alarm_lock);
+
+	/*
+	 * The SMI Voltage status register is the only register giving a status
+	 * for voltages. A bit is set for each input crossing a threshold, in
+	 * both direction, but the "inside" or "outside" limits info is not
+	 * available. Also this register is cleared on read.
+	 * Note : this is not explicitly spelled out in the datasheet, but
+	 * from experiment.
+	 * To deal with this we use a status cache with one validity bit and
+	 * one status bit for each input. Validity is cleared at startup and
+	 * each time the register reports a change, and the status is processed
+	 * by software based on current input value and limits.
+	 */
+	ret =3D regmap_read(data->regmap, 0x1e, &val); /* SMI Voltage status */
+	if (ret < 0)
+		goto abort;
+
+	/* invalidate cached status for all inputs crossing a threshold */
+	data->in_status &=3D ~((val & 0x0f) << 4);
+
+	/* if cached status for requested input is invalid, update it */
+	if (!(data->in_status & (0x10 << sattr->index))) {
+		ret =3D nct7802_read_voltage(data, sattr->nr, 0);
+		if (ret < 0)
+			goto abort;
+		volt =3D ret;
+
+		ret =3D nct7802_read_voltage(data, sattr->nr, 1);
+		if (ret < 0)
+			goto abort;
+		min =3D ret;
+
+		ret =3D nct7802_read_voltage(data, sattr->nr, 2);
+		if (ret < 0)
+			goto abort;
+		max =3D ret;
+
+		if (volt < min || volt > max)
+			data->in_status |=3D (1 << sattr->index);
+		else
+			data->in_status &=3D ~(1 << sattr->index);
+
+		data->in_status |=3D 0x10 << sattr->index;
+	}
+
+	ret =3D sprintf(buf, "%u\n", !!(data->in_status & (1 << sattr->index)));
+abort:
+	mutex_unlock(&data->in_alarm_lock);
+	return ret;
+}
+
 static ssize_t temp_show(struct device *dev, struct device_attribute *attr=
,
 			 char *buf)
 {
@@ -660,7 +722,7 @@ static const struct attribute_group nct7802_temp_group =
=3D {
 static SENSOR_DEVICE_ATTR_2_RO(in0_input, in, 0, 0);
 static SENSOR_DEVICE_ATTR_2_RW(in0_min, in, 0, 1);
 static SENSOR_DEVICE_ATTR_2_RW(in0_max, in, 0, 2);
-static SENSOR_DEVICE_ATTR_2_RO(in0_alarm, alarm, 0x1e, 3);
+static SENSOR_DEVICE_ATTR_2_RO(in0_alarm, in_alarm, 0, 3);
 static SENSOR_DEVICE_ATTR_2_RW(in0_beep, beep, 0x5a, 3);
=20
 static SENSOR_DEVICE_ATTR_2_RO(in1_input, in, 1, 0);
@@ -668,19 +730,19 @@ static SENSOR_DEVICE_ATTR_2_RO(in1_input, in, 1, 0);
 static SENSOR_DEVICE_ATTR_2_RO(in2_input, in, 2, 0);
 static SENSOR_DEVICE_ATTR_2_RW(in2_min, in, 2, 1);
 static SENSOR_DEVICE_ATTR_2_RW(in2_max, in, 2, 2);
-static SENSOR_DEVICE_ATTR_2_RO(in2_alarm, alarm, 0x1e, 0);
+static SENSOR_DEVICE_ATTR_2_RO(in2_alarm, in_alarm, 2, 0);
 static SENSOR_DEVICE_ATTR_2_RW(in2_beep, beep, 0x5a, 0);
=20
 static SENSOR_DEVICE_ATTR_2_RO(in3_input, in, 3, 0);
 static SENSOR_DEVICE_ATTR_2_RW(in3_min, in, 3, 1);
 static SENSOR_DEVICE_ATTR_2_RW(in3_max, in, 3, 2);
-static SENSOR_DEVICE_ATTR_2_RO(in3_alarm, alarm, 0x1e, 1);
+static SENSOR_DEVICE_ATTR_2_RO(in3_alarm, in_alarm, 3, 1);
 static SENSOR_DEVICE_ATTR_2_RW(in3_beep, beep, 0x5a, 1);
=20
 static SENSOR_DEVICE_ATTR_2_RO(in4_input, in, 4, 0);
 static SENSOR_DEVICE_ATTR_2_RW(in4_min, in, 4, 1);
 static SENSOR_DEVICE_ATTR_2_RW(in4_max, in, 4, 2);
-static SENSOR_DEVICE_ATTR_2_RO(in4_alarm, alarm, 0x1e, 2);
+static SENSOR_DEVICE_ATTR_2_RO(in4_alarm, in_alarm, 4, 2);
 static SENSOR_DEVICE_ATTR_2_RW(in4_beep, beep, 0x5a, 2);
=20
 static struct attribute *nct7802_in_attrs[] =3D {
@@ -1011,6 +1073,7 @@ static int nct7802_probe(struct i2c_client *client,
 		return PTR_ERR(data->regmap);
=20
 	mutex_init(&data->access_lock);
+	mutex_init(&data->in_alarm_lock);
=20
 	ret =3D nct7802_init_chip(data);
 	if (ret < 0)
--=20
2.17.1
