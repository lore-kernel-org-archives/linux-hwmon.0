Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB70A1CCB50
	for <linux-hwmon@vger.kernel.org>; Thu, 10 Oct 2024 15:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728574728; cv=none; b=S7U/UIKX+9fbVQYZVa0iQFmBhCCsyGNBL+VT265EKjeMXzpB5mh9ZTbstJ3GgoQcfEL42PYE8UBwzczMy+vvbGIjOa5AmYCFznQgnQnbDOx7h0NbU0achIP4nRBAKIAx/6w/lcnKGoqLh+mzLDMJoL03p/VaorUv2z2Kwqx6Hy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728574728; c=relaxed/simple;
	bh=4qejwvYNB9h9Jj8ORH3RJbc068wHRdn2WreAUWF9X6M=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=d+/eBlfbMuyOYX+m6o2XnwcyGdGhk+CE0Evd0ctBDcmYl9gO3XEPnjwA18zuR6YdJRFsnMYXzz5u94mwY+HAb8A1aHm7PEeOOU2DC0o4jj6E2JSHYfy3DaPdMrtxCqsPOebA422mFNT/OtXqMcaKtCdHZC+pOrxoSBG5ibddwPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OHT7NBTj; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OHT7NBTj"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5c935d99dc5so951317a12.1
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Oct 2024 08:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728574725; x=1729179525; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EYEcyARai9gaWU1BUTH+5Wv5R9S3qtLj4+3KobLvEGM=;
        b=OHT7NBTjEf7NQE4EowixDI6y5KNt9rp8IBf3DBRTEtmFMnFFGb6WNT0yD10PYyYwCo
         aZp1D9N57g6l/pvOjpEarzMS5rQd4cSRVFyTV/Ja4QaEyFf+L9ZL6qqoAOYu07Isif2A
         SLDcWEB6jgitaf1/0b/MTNjkm7cf4GXbHy8j+GzZaGX1ANDZ099Qh5JsBquQQ6MBRXuw
         seFVeQU93EgmW3pSeWPxyh18KpHhNyVj5RTYFAvToNwI8LWhSA3Jq4iB3DiU7vnlP6pc
         lt8yOk4hjUHr6Y14Izj+NInNnivWchwSzP8RChdXMaKlKtTNce6JSdt/bbl0/jJXiMD5
         OQ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728574725; x=1729179525;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EYEcyARai9gaWU1BUTH+5Wv5R9S3qtLj4+3KobLvEGM=;
        b=SKqgzU5vavXJn4mMRB5CpBN2TzW+f5qcUuPWqQyH2Wqhnxo/qRWQ17g7rqfqXxmZBM
         dd9vMxV45CzzNJVAEbEE204jeo+og+MMOQ9u0ndYzmUl2zkx4AzEaEbuzIsH5UpJ2cPn
         0VvdUC/rTBTVB0bWlz4O/f7AARc7TcZK9yEEEJ8gYhdFRK5oQGNSUOGVvEv9T3+p0Rx1
         bF8tc7mxuZjQsYLrmRwOwRRCt+jlqNjby6kj2gk79/cj6kkfEu1i4xmhhSanxJfCT+Bc
         YKFjTMPcd3f80F/SyV/0qyeK55pS+/+3zzdxaQbZpcaJ8MyiPf+BGBNrEe8JnWCx9mBP
         zsfg==
X-Gm-Message-State: AOJu0YwdF35lNbAGsvmWxJFxYtyg2SLkwE81IrB13N1iS3ZCOO2e3doM
	LKaJA+wfSGO6Um5sFQqnz/uHV3fCL89gCrWy4iG2vD5Bs/Uhv5WgKD5avuaD
X-Google-Smtp-Source: AGHT+IEoSL3Z0VbGvUzyIa/cKsePsQVEvrbpQ9WFas/idl5cyysDbjAkafPKw1h6OpLZE6ZUfBTlag==
X-Received: by 2002:a05:6402:2807:b0:5c5:c4ab:c2c8 with SMTP id 4fb4d7f45d1cf-5c91d40a336mr5612865a12.0.1728574724904;
        Thu, 10 Oct 2024 08:38:44 -0700 (PDT)
Received: from ?IPV6:2a02:3100:ac3e:8500:f101:eb49:ef42:3d5f? (dynamic-2a02-3100-ac3e-8500-f101-eb49-ef42-3d5f.310.pool.telefonica.de. [2a02:3100:ac3e:8500:f101:eb49:ef42:3d5f])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5c93729675csm922525a12.83.2024.10.10.08.38.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 08:38:44 -0700 (PDT)
Message-ID: <c16acf3c-6ca6-4033-a115-58f6031ed868@gmail.com>
Date: Thu, 10 Oct 2024 17:38:45 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] hwmon: Add static visibility member to struct hwmon_ops
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Several drivers return the same static value in their is_visible
callback, what results in code duplication. Therefore add an option
for drivers to specify a static visibility directly.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/hwmon/hwmon.c | 19 +++++++++++++++----
 include/linux/hwmon.h |  4 +++-
 2 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 9c35c4d03..8e9159e8d 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -145,6 +145,17 @@ static const struct class hwmon_class = {
 
 static DEFINE_IDA(hwmon_ida);
 
+static umode_t hwmon_ops_is_visible(const struct hwmon_ops *ops,
+				    const void *drvdata,
+				    enum hwmon_sensor_types type,
+				    u32 attr, int channel)
+{
+	if (ops->visible)
+		return ops->visible;
+
+	return ops->is_visible(drvdata, type, attr, channel);
+}
+
 /* Thermal zone handling */
 
 /*
@@ -267,8 +278,8 @@ static int hwmon_thermal_register_sensors(struct device *dev)
 			int err;
 
 			if (!(info[i]->config[j] & HWMON_T_INPUT) ||
-			    !chip->ops->is_visible(drvdata, hwmon_temp,
-						   hwmon_temp_input, j))
+			    !hwmon_ops_is_visible(chip->ops, drvdata, hwmon_temp,
+						  hwmon_temp_input, j))
 				continue;
 
 			err = hwmon_thermal_add_sensor(dev, j);
@@ -506,7 +517,7 @@ static struct attribute *hwmon_genattr(const void *drvdata,
 	const char *name;
 	bool is_string = is_string_attr(type, attr);
 
-	mode = ops->is_visible(drvdata, type, attr, index);
+	mode = hwmon_ops_is_visible(ops, drvdata, type, attr, index);
 	if (!mode)
 		return ERR_PTR(-ENOENT);
 
@@ -1033,7 +1044,7 @@ hwmon_device_register_with_info(struct device *dev, const char *name,
 	if (!dev || !name || !chip)
 		return ERR_PTR(-EINVAL);
 
-	if (!chip->ops || !chip->ops->is_visible || !chip->info)
+	if (!chip->ops || !(chip->ops->visible || chip->ops->is_visible) || !chip->info)
 		return ERR_PTR(-EINVAL);
 
 	return __hwmon_device_register(dev, name, drvdata, chip, extra_groups);
diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
index 5c6a421ad..667229956 100644
--- a/include/linux/hwmon.h
+++ b/include/linux/hwmon.h
@@ -368,7 +368,8 @@ enum hwmon_intrusion_attributes {
 
 /**
  * struct hwmon_ops - hwmon device operations
- * @is_visible: Callback to return attribute visibility. Mandatory.
+ * @visible:	Static visibility. If non-zero, @is_visible is ignored.
+ * @is_visible: Callback to return attribute visibility. Conditionally mandatory.
  *		Parameters are:
  *		@const void *drvdata:
  *			Pointer to driver-private data structure passed
@@ -412,6 +413,7 @@ enum hwmon_intrusion_attributes {
  *		The function returns 0 on success or a negative error number.
  */
 struct hwmon_ops {
+	umode_t visible;
 	umode_t (*is_visible)(const void *drvdata, enum hwmon_sensor_types type,
 			      u32 attr, int channel);
 	int (*read)(struct device *dev, enum hwmon_sensor_types type,
-- 
2.47.0

