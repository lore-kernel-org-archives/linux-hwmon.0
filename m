Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897610;
	b=eF+47dHIlYO605FuUBVNrur6WWhaebkcFu3YRcV/+XRyZmrce5MMOtbIizLJYXwdqcZX
	 zb81+f7iDdyJqg425wruMRG7c2+5CGohMK3QDxignd3XCOU9OW6MGcfwa26CmVStBwL9Y
	 96/2IAcBT0fvcWF2MCZEJpKOAUNrooZUM54UYe5Gb9oU4MFmsIOwQyGt1oJg72W3AbeeV
	 47Gs+Fdz6SwKHiRVsGAOTcAk5aMhu7Ja14nZzKj6g9/NS6zHxI2WRnNEp2kb6xClkepqC
	 Md7WhzfXqKOf65mCGGHH1VRMyoYMZ90lMNiwubsl7fb0Yl37cLtbvVDjdw0NYMT92LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897610;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=ENk4A+RlULy01C+nr6yI9DTf6CQ3igs3yO+YxFh8EPU=;
	b=vvGSa3gabn/ejoIU7p8ns+GM59sh3/6YNhiWFrNiVRKPc5coyPYApRP7lG8XYlSkYSy+
	 gso/MRMJ4za1/0dbBryKABUnM8h4JDifjJdOwgyeNYLMNDZ5N6fuV5oH0DKEP08U3j17P
	 TEZjZUKLbILxKrasaMfkWc/YVoI+1MugtUNi7ltbOQcZzWdGRTwjNoKJTaP7GZtKLGQxQ
	 C2Go/d4ZDahMooAzGdmJ94h71oj5eBRMwjtrdrqe+eyATq+u7cr2NxOen7v7Tgj+g8YgB
	 QPF3+EJKkkYxbkRzGRoRTufTtiL5sfWAMtuZo3K27kfERHeiZ9hRiaNXnVzbkrHkJ3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Xqu1xBTL;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B17F60A261D
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 03:06:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B17F60A261D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Xqu1xBTL
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36681e85e87so1520336eec.1
        for <linux-hwmon@vger.kernel.org>; Sat, 24 Oct 2026 20:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897610; x=1793502410; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ENk4A+RlULy01C+nr6yI9DTf6CQ3igs3yO+YxFh8EPU=;
        b=Xqu1xBTLF+JuQ1VnvXwa8sjTYzw1pmgo9tVPnnvFep/n2EWpGWt9KaN/cq2BFK2vGv
         gchptLZ+QWw3Ct4fdYIdhBy8NfgZr7AbBPVLDP1G6UlFMIboIcfPv7xfSOeJfAKpkAbF
         svsolpB28HyfQjNuLdG4Nt2YyjE3TVts4nMx0nzn03v1BKaKqZaQ9ztCtKPQP5SD/OV6
         /TWLZnGJMQqEBbiHMKJNFzEGjpFkID5NIwA1ztbybAvrvWGS7ES9cr1aMFYecAcmPHz4
         wcf0zgs59upkwOYtsdrpxeHokh+bMCMl5rdq/kKO4P/4kUp8QmdshtsHhrXY/5aymdkC
         oVCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897610; x=1793502410;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ENk4A+RlULy01C+nr6yI9DTf6CQ3igs3yO+YxFh8EPU=;
        b=AFcV/2/3oxoeM4bpCiqyCxUCcsH8sFtpCbVau0fPwnTFUFRk4z1UOm7xPyE52laUuZ
         7+LYRmX1qFhJs+KldjiXDRUBrylNUXWz2lYbAmYtVJwwBmt60EWmb3qAr8mBA/SVWF9O
         f/89p8oJwNRYT9vzlPeZ1b3VdXYj+mkruXx0lKAqaNYJV4Wdt+K1eZwA/ykxs8sFynb1
         301tQ2mPqA0lXfo4g3jvPFfPxJtNF+RxzmfVISHxK5fYkj+Q/SyPaPEKAdHIhf357eFz
         SpZejOYUc30+XxjkR4+cfSa2jfuxrYvhPoLFZN3jmrZZ7b4kM/iaQKYabwoL3abgPekh
         M7lA==
X-Gm-Message-State: AFq9FYLvvMNLfrz3IAjb2Uqv87D5VYE2ehtfHks6ABCS4+jhf0Dvz8ii
	IBLma5cbzzV30UPY3RFtGT3TE6uFf64pZlR7aqbGeldIpOsjkhBqheNa
X-Gm-Gg: AYBFou3G2m2KMU53FwsTErxmMTdg0GgRLGMcIu9DYUvIPeHRkM3ZEWcwe0rVlrZmcfS
	VfT5MGSrdXrEZrID5wpMGXXXwLUHWqV4/Q5ijKalB0SuVMsEhAjaUx5YFdkriMt9OMUW4gMm/G5
	gBW81+ak7oSQpV38iiCsEKXNU2PlGg3fXpeMUNGS2NASzMDHk4AAw8Un6iNOs3BQLwhjO8tLQ6U
	FIbHWPfpm44+f3+0Ge149fdamL1w1mnKmlHQn9XeglhCEFDAM62iW8XeAgfdu1J3KFU9Xu1GPVf
	0QItmnQV2Y6WOE3O/9FlSdF9ALW556MuTPs6uzaMJC/rmkCfjLhKTmsHB3n4TLGP3EsSwYgIDjq
	zhdlH95++pWKSBj+7Vhus4uz+AbbxyeAcLXHKJxzyeE90cE6UOcjAfrMFEClKtGxVLvRbJ1WhUP
	TOJ7AMSNwGXaj6FeU5SK+6ofTLbg9e1Yd17tbZg5dXFi1dgekJKAZznjLAUlqQlct0ynmKhG5Bg
	BxHK4TMQXXeTVbcUBItSR2EwCQ1MQLObdULqVchlbvwGdcLwkoIKsB5nHaUTlU+g3CXi4Yr9Odr
	y+TjwjrimDGx5ik8iv7mO2zjviF1ky/u44z7MNuDOyLV
X-Received: by 2002:a05:693c:66cf:20b0:369:f18f:34ab with SMTP id 5a478bee46e88-369f18f376amr2468251eec.11.1792897609664;
        Sat, 24 Oct 2026 20:06:49 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:48 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 20:06:32 -0700
Subject: [PATCH 29/31] hwmon: (pmbus/ucd9000) use 4-argument
 i2c_smbus_read_block_data()
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-29-e81941ad0cd3@gmail.com>
References: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
In-Reply-To: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Andy Chung <andy.chung@amd.com>, 
 Ninad Palsule <ninad@linux.ibm.com>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Robert Marko <robert.marko@sartura.hr>, 
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, 
 Daniel Nilsson <daniel.nilsson@flex.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Pass the buffer size to i2c_smbus_read_block_data() in
ucd9000_get_mfr_status() and ucd9000_probe().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hwmon/pmbus/ucd9000.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.c
index f76c2913c9ca..2645d3e78e3f 100644
--- a/drivers/hwmon/pmbus/ucd9000.c
+++ b/drivers/hwmon/pmbus/ucd9000.c
@@ -390,7 +390,8 @@ static int ucd9000_get_mfr_status(struct i2c_client *client, u8 *buffer)
 	if (ret < 0)
 		return ret;
 
-	return i2c_smbus_read_block_data(client, UCD9000_MFR_STATUS, buffer);
+	return i2c_smbus_read_block_data(client, UCD9000_MFR_STATUS,
+					  I2C_SMBUS_BLOCK_MAX, buffer);
 }
 
 static int ucd9000_debugfs_show_mfr_status_bit(void *data, u64 *val)
@@ -515,7 +516,7 @@ static int ucd9000_probe(struct i2c_client *client)
 		return -ENODEV;
 
 	ret = i2c_smbus_read_block_data(client, UCD9000_DEVICE_ID,
-					block_buffer);
+					sizeof(block_buffer) - 1, block_buffer);
 	if (ret < 0) {
 		dev_err(&client->dev, "Failed to read device ID\n");
 		return ret;
@@ -565,7 +566,7 @@ static int ucd9000_probe(struct i2c_client *client)
 
 	/* Everything else is configurable */
 	ret = i2c_smbus_read_block_data(client, UCD9000_MONITOR_CONFIG,
-					block_buffer);
+					sizeof(block_buffer) - 1, block_buffer);
 	if (ret <= 0) {
 		dev_err(&client->dev, "Failed to read configuration data\n");
 		return -ENODEV;
@@ -602,6 +603,7 @@ static int ucd9000_probe(struct i2c_client *client)
 						  UCD9000_FAN_CONFIG_INDEX, i);
 			ret = i2c_smbus_read_block_data(client,
 							UCD9000_FAN_CONFIG,
+							sizeof(data->fan_data[i]),
 							data->fan_data[i]);
 			if (ret < 0)
 				return ret;

-- 
2.56.0.257.gf7497c7d27-goog

