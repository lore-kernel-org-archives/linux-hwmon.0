Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B414B4D9549
	for <linux-hwmon@vger.kernel.org>; Fri, 25 Sep 2026 18:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790360621; cv=none; b=JqDQChaJt5oYC2tK7AfJSUm7KmM3qRWSwc4PjdDEm9l7aui/SiaVjTmhK7S6b4CrB7l49PhngC3oBfU6qzZXKp9qjh1WHFav/Lp6wS8XU6+ItDyfHxlUnFujVYvte+uxE9mcTUoWZvwZNIb+C6XbHr/2cgF7vZENwOZVfaGFdzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790360621; c=relaxed/simple;
	bh=s5+8pjr6Fwtuw6XJ7hD5nPa7v+Qr2/LhjInKDahwUig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hQLkJ/vbbAVGkNW+GW7yOTO3INAVFb3/hYx6P/8244/5fWhLTIT60sacLheaz/rMsEO6BS9XxhzfBIW/OuoXPU3F7RuNZLWoYd6NH++34mZT5Es1PY95Uql34OqipeTL665MEADCav8nnNp0Otol7/3LvjjhsCRsiUre0VcCOLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspiral.be; spf=none smtp.mailfrom=inspiral.be; dkim=pass (2048-bit key) header.d=inspiral-be.20251104.gappssmtp.com header.i=@inspiral-be.20251104.gappssmtp.com header.b=XQDpfvER; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspiral.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=inspiral.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inspiral-be.20251104.gappssmtp.com header.i=@inspiral-be.20251104.gappssmtp.com header.b="XQDpfvER"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e79a408deso7126195e9.2
        for <linux-hwmon@vger.kernel.org>; Fri, 25 Sep 2026 11:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inspiral-be.20251104.gappssmtp.com; s=20251104; t=1790360618; x=1790965418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jlZAHXA/+Siu5/Nc7tK0sL1VUl2GgSD7bLrNdmf+Xek=;
        b=XQDpfvERlhhx/yGZH7dwnQNKgU+e6looAe/m0h9ND816aiQnWE4dfjqieNhxnGZYXv
         2zXvoqxVulpztyq32o0uuDGzA21x0l/3VGZ4w5u94p8cwBCAfXmbqrp1hL8eDDZGOs6C
         uJelOOboM8fRy3EADVlkJScaiWpCVuvwzJKtXtkXnPduuyOya2W8HwDaRS0XYmQ0cPYC
         6nZ0K+EAPY26dlqdmZCdWr/Gpreb+g/Vuo4tWP6b2Y5AWieIh2D5mDlNKVHmJULikb6j
         1U5srnpL2NnznjwWpimwhvaR7ddnl9HOsMC7oqRkLrnAEYQQ9UM/crEwztn1CShSSlnX
         SMrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790360618; x=1790965418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jlZAHXA/+Siu5/Nc7tK0sL1VUl2GgSD7bLrNdmf+Xek=;
        b=IeKDXcb0+cL6VnGN1eZKPJ8X1OsGiFLuL9ifNKrsMHRQdolSiVOXDDS+NW0H6YkmgE
         LayLhtE0zYf/Hrnfg1reWDM24yxBqeCpv5vANxoEyeIhufsJ/x1sHQAW7U8bCHgUKmML
         GTRU9lufMeI5RnxJ34L2mLDuOW/1w9M3RLzmJkwms27/7r8/webrNKtlpxxdeG/vRSce
         rMW/sgvftSF/IqPVOArF2nUhcwUkkR0WofRCWaI0SrKPj5mMiINy7lIq0C8yaLsI25co
         gqzUl+7Nr5JTWV5Ix5N5LvUuZwFX79TcENv8kJojRaJoKo7d+DqXragzjdEyKJDcVn7G
         kyXw==
X-Gm-Message-State: AFuF++lbbAhZz/nQidXJvn+vGVW4bDzRsj887TTncWULBUJP7hZVeF/D
	PEyMsyJ94pykubLzxUcov//rSBvw+sQ0zzk12upAflCboxPbagL88ZkR4Gkq09ny9ds=
X-Gm-Gg: AYBFou2kx1idBAVHpNvcffDYc9M3+fPsSGnO+OfjrqWzB3/bdhM1I/NmzAPBKRCjuGZ
	ifIMLJPzwsLK6a328v66i53o1Pdz2U6EWSsrQBu0VPTUSPS/KbfIxa8ziAoZnQMhx0MQ29K6MA2
	ilV/OF6KICC+HKQslPPAgrV7ph+7SBax7UN4zgt9J22QBr64hVHPT56zwJwYVLo+FvgHBciZ6nA
	AHwzrTIuFeQXFifS3IMMIsHuwR4RmlUO1HwJatoyIsxFZ2AiVWmoH6amzxBL9zOIJtHGbMXd3AS
	qpBRmxXV4fwxx194hmDzQieBlNyr1TQP6SuG/9iQmLKeMvbrDbY63bJ/8CRmuqQCuveVQ/69U6A
	D7l5ZRFfqIzhJSBN2rQmOpuOFP0AfkYiZMl81Ml6nSAQAuR7En6qLoPHEZ6Jdubxj3lUzqnCrvf
	MKMpdj61945JMy0+tIyjchdjZazRrWAMk0PkDDNK+wzyr3VYSPNLIGks33avK4H0npjYsdf2KTe
	3xCbEx8zJ6e49CgNTbB7z8/n9FTDyW/wxjrOUj5XaGYbdgw
X-Received: by 2002:a05:600c:4689:b0:49f:bc8a:b103 with SMTP id 5b1f17b1804b1-49fe66841f8mr118534915e9.0.1790360617819;
        Fri, 25 Sep 2026 11:23:37 -0700 (PDT)
Received: from vger.localdomain (178-119-186-126.access.telenet.be. [178.119.186.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm165253895e9.13.2026.09.25.11.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 11:23:36 -0700 (PDT)
From: Tom Verdonck <tom.verdonck@inspiral.be>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tom Verdonck <tom.verdonck@inspiral.be>,
	stable@vger.kernel.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Subject: [PATCH 3/3] hwmon: (sht4x) Fix jiffies wraparound in heater-ready check
Date: Fri, 25 Sep 2026 20:23:24 +0200
Message-ID: <7b2087ccb963e097cf3f6333efaec0c46549003b.1790358356.git.tom.verdonck@inspiral.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1790358356.git.tom.verdonck@inspiral.be>
References: <cover.1790358356.git.tom.verdonck@inspiral.be>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sht4x stores in ->heating_complete the jiffies deadline at which the
current heater pulse finishes. It is set once at probe (to jiffies) and
only updated when the heater is explicitly enabled via sysfs, so in the
common case where the heater is never used it stays frozen at its probe
value.

->heating_complete is an unsigned long compared with time_before(),
whose signed difference is only meaningful while the two values are
within LONG_MAX jiffies of each other. Because the deadline is frozen,
jiffies keeps advancing away from it, and after 2^31 jiffies the
difference flips sign. On a 32-bit HZ=100 kernel that happens ~248.5
days after boot. time_before() in sht4x_read_values() then wrongly
reports that heating is still in progress and the read path executes

	msleep(jiffies_to_msecs(data->heating_complete - curr_jiffies));

with a bogus, huge delta, blocking the temperature read for a very long
time instead of returning data. The heater_enable sysfs attributes are
affected the same way (spurious -EBUSY and "1" readback).

Store the deadline as a 64-bit jiffies value and compare it with
get_jiffies_64()/time_before64(), which does not wrap in any practical
uptime.

Fixes: 0eed6fc3d2b9 ("hwmon: (sht4x): add heater support")
Cc: stable@vger.kernel.org
Signed-off-by: Tom Verdonck <tom.verdonck@inspiral.be>
---
 drivers/hwmon/sht4x.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/hwmon/sht4x.c b/drivers/hwmon/sht4x.c
index a97dda9e92dc..da2b6130fca7 100644
--- a/drivers/hwmon/sht4x.c
+++ b/drivers/hwmon/sht4x.c
@@ -67,7 +67,7 @@ DECLARE_CRC8_TABLE(sht4x_crc8_table);
  */
 struct sht4x_data {
 	struct i2c_client	*client;
-	unsigned long		heating_complete;	/* in jiffies */
+	u64			heating_complete;	/* in jiffies */
 	bool			data_pending;
 	u32			heater_power;	/* in milli-watts */
 	u32			heater_time;	/* in milli-seconds */
@@ -92,14 +92,14 @@ static int sht4x_read_values(struct sht4x_data *data)
 	u8 crc;
 	u8 cmd[SHT4X_CMD_LEN] = {SHT4X_CMD_MEASURE_HPM};
 	u8 raw_data[SHT4X_RESPONSE_LENGTH];
-	unsigned long curr_jiffies;
+	u64 curr_jiffies;
 
-	curr_jiffies = jiffies;
-	if (time_before(curr_jiffies, data->heating_complete))
+	curr_jiffies = get_jiffies_64();
+	if (time_before64(curr_jiffies, data->heating_complete))
 		msleep(jiffies_to_msecs(data->heating_complete - curr_jiffies));
 
 	if (data->data_pending &&
-	    time_before(jiffies, data->heating_complete + data->update_interval)) {
+	    time_before64(get_jiffies_64(), data->heating_complete + data->update_interval)) {
 		data->data_pending = false;
 	} else {
 		next_update = data->last_updated +
@@ -237,7 +237,7 @@ static ssize_t heater_enable_show(struct device *dev,
 {
 	struct sht4x_data *data = dev_get_drvdata(dev);
 
-	return sysfs_emit(buf, "%u\n", time_before(jiffies, data->heating_complete));
+	return sysfs_emit(buf, "%u\n", time_before64(get_jiffies_64(), data->heating_complete));
 }
 
 static ssize_t heater_enable_store(struct device *dev,
@@ -279,14 +279,14 @@ static ssize_t heater_enable_store(struct device *dev,
 
 	guard(hwmon_lock)(dev);
 
-	if (time_before(jiffies, data->heating_complete))
+	if (time_before64(get_jiffies_64(), data->heating_complete))
 		return -EBUSY;
 
 	ret = i2c_master_send(data->client, &cmd, SHT4X_CMD_LEN);
 	if (ret < 0)
 		return ret;
 
-	data->heating_complete = jiffies + msecs_to_jiffies(heating_time_bound);
+	data->heating_complete = get_jiffies_64() + msecs_to_jiffies(heating_time_bound);
 	data->data_pending = true;
 	return count;
 }
@@ -410,7 +410,7 @@ static int sht4x_probe(struct i2c_client *client)
 	data->client = client;
 	data->heater_power = 200;
 	data->heater_time = 1000;
-	data->heating_complete = jiffies;
+	data->heating_complete = get_jiffies_64();
 
 	crc8_populate_msb(sht4x_crc8_table, SHT4X_CRC8_POLYNOMIAL);
 
-- 
2.53.0

