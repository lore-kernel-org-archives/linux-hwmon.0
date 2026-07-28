Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE2F1DF74F
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 00:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785198188; cv=none; b=Um4iEivxzfw+iM4m/i7H9YDE3Y4/cnNFWe6qt7UWNMntsckWG0lipBFDUT92iqIIQtY5OPsJnpJUCc188HeL5XnQG5noI9HFnFHDrzRyTpjAn0yIYpgJMFLsYODbXKZSjOt8xzw5dVLuFVgx2dv/qpQd8cKKN7mnH7ETZPaDgf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785198188; c=relaxed/simple;
	bh=I9oZIPUckVI2Bbf9EzAvTugPHOS6/E6ouPMxLjLZ8+8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C0qoYEeoIpbBgXkk7V7u4YOZdMzOCRNv+UaHrwJAeQAfxi52bxSOi68WRGP447zoUX1+oanaff9L6bupa4hOW2nBG1wysQdwQz1II3JTqV63nf4lTJT18Hot97gbtBpG+BcNCElasFhDS46Dg5y0zIQbCF/hYQq8fvIeCWXYRAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CMtHjwB/; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CMtHjwB/"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-80dc4a68e4aso36122887b3.0
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 17:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785198185; x=1785802985; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Kmr1YgrJ4oRQYtmiDZKltCYWP1t62Qg//SOlsWViac=;
        b=CMtHjwB/TlT7SZwb5yr/zviQqGvww+TL38NDpfcwAjskTZ1d4T9EzYsVpNeNNKviai
         cBcEKjtrVezhYmyvowsbQbSfqSy5rM67OR19QMDg4/MRrDFxPd3RMKr3gF1DI0RmeIkT
         aUSva9is7pGPKhSBchUa6GnEOzL2jDKu2B6RuBcFZk+3OrRZEeydi5UkRouRuK3i9DSp
         1F7Jvve3M/EPbHd3fRN1jY0lRu4efFF7AVRFzqFEhs2BoFjntPMFc3HUbxXzIhZGv741
         9y4LnMF0m7O6XjP/aZxWz2V7cNctJ4ts3C0OKz8q82mrgfoQ31U4h5zYngeTIQJq7k1q
         eCJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785198185; x=1785802985;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Kmr1YgrJ4oRQYtmiDZKltCYWP1t62Qg//SOlsWViac=;
        b=MO+BNltUHhUf3kXLy80FlhH6KgbqLU8wt61I0atHQ+FOxmm7lU9GK32mQeuwFb/ycn
         lI7PMGSWeX0VgTpFf0OJ9ljW8pjSw6hHTBnzuQtL6cruAa79dTMp7AysHIpQpyxCEi57
         dvYbd6qSvDrRRGF3bD1EUOetEfAwzyX+dBbAhZoQ87Ca5iQ5bCtD+Ftir5M1GrPCV4Zn
         lHm+F7cfzn7YqJwP1U/xNOKeW4Zc5yXm32IcOk0u2Zz8xKQLHDlURMh09MGXGXXitdav
         lrRciDvuy+g9IqBy+PFj1WDNNs3KAB9zdUkjp++Et/5zHDq7KiAuAc89yKYiBnTVviLx
         /kEA==
X-Gm-Message-State: AOJu0YwwT15EYAqE/UNpoC9ZYpyXgDCi+iQb/16gwORSRVlTeQaK2yqk
	4aC/qETtj3ESgpofSudpVzzWEaWfykEwqh7jrVnHc2FeLH6w2PhRIjphekABhWWw
X-Gm-Gg: AR+sD13KzUwg2pZBdoWUjU0vHXYTMBtshyWfWq+WigeeiZ2npxra5tanKX6GgdmEM8h
	loCIUWBgW4TUsN/kD9SIPoAI6qq2wg/HVfNXMWdFT+BK9gAPatQ6V7w1v1FkJINS+x91BF8C9kX
	d2MzfHdwdEG8KL9V4aYEaekkhyFo1oSA6YwPgJ25+ho9nDvCtTFdqOvnpJbx1tL/kAUAH7MdW4N
	GDNR2mKBHjAnYMsEItpFFG1Sicj41I4Rsy5w+V8FPYZl53JgoyQKoKXBOO4uxEYsSYwIpWvUgJA
	0D3MjXz+naf6JmZHOau5UTesAGgCRaHjw5LlLJMMI+ppVmo4vSpxBDaj1l8LbvAbrUN5ykP/WaN
	DkeGFz9m3mUQX3J6490m0hJBGda2D4xE38v8TqRIaDIzoLSlGlj+aly1UUYRyt8u6moM/UcGxVW
	76TmkTQTr6ieaLYin2Dg==
X-Received: by 2002:a05:690c:498d:b0:81c:d5ae:739c with SMTP id 00721157ae682-81f99238c15mr522597b3.49.1785198185465;
        Mon, 27 Jul 2026 17:23:05 -0700 (PDT)
Received: from tresc054937.tre-sc.gov.br ([187.65.210.13])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f655acc7csm39583707b3.0.2026.07.27.17.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 17:23:02 -0700 (PDT)
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Mon, 27 Jul 2026 21:22:22 -0300
Subject: [hwmon PATCH v2 6/8] hwmon: (adt7470) Use cached PWM frequency
 value
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-adt7470_fixes-v2-6-598e38a46ba6@gmail.com>
References: <20260727-adt7470_fixes-v2-0-598e38a46ba6@gmail.com>
In-Reply-To: <20260727-adt7470_fixes-v2-0-598e38a46ba6@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, 
 Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Darrick J. Wong" <djwong@us.ibm.com>, 
 "Mark M. Hoffman" <mhoffman@lightlink.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luiz Angelo Daros de Luca <luizluca@gmail.com>
X-Mailer: b4 0.15.2

adt7470_pwm_read() currently ignores failures returned by
pwm1_freq_get(). If the register read fails, the negative error code is
returned through *val while the function itself reports success,
potentially exposing a negative PWM frequency through sysfs.

Fix this by using the cached PWM frequency maintained by the driver,
eliminating the register access from the read path.

Apart from the corrected error propagation and using the cached value,
no functional change is intended.

Fixes: ef67959c4253 ("hwmon: (adt7470) Convert to use regmap")
Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
---
 drivers/hwmon/adt7470.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
index c6fc7d38d698..1fbca4869b7b 100644
--- a/drivers/hwmon/adt7470.c
+++ b/drivers/hwmon/adt7470.c
@@ -182,6 +182,7 @@ struct adt7470_data {
 	u8			pwm_min[ADT7470_PWM_COUNT];
 	s8			pwm_tmin[ADT7470_PWM_COUNT];
 	u8			pwm_auto_temp[ADT7470_PWM_COUNT];
+	u32			pwm_freq;
 
 	struct task_struct	*auto_update;
 	unsigned int		auto_update_interval;
@@ -756,7 +757,7 @@ static ssize_t force_pwm_max_store(struct device *dev,
 }
 
 /* These are the valid PWM frequencies to the nearest Hz */
-static const int adt7470_freq_map[] = {
+static const u32 adt7470_freq_map[] = {
 	11, 15, 22, 29, 35, 44, 59, 88, 1400, 22500
 };
 
@@ -796,7 +797,7 @@ static int adt7470_pwm_read(struct device *dev, u32 attr, int channel, long *val
 		*val = 1 + data->pwm_automatic[channel];
 		break;
 	case hwmon_pwm_freq:
-		*val = pwm1_freq_get(dev);
+		*val = data->pwm_freq;
 		break;
 	default:
 		return -EOPNOTSUPP;
@@ -809,12 +810,14 @@ static int pwm1_freq_set(struct device *dev, long freq)
 {
 	struct adt7470_data *data = dev_get_drvdata(dev);
 	unsigned int low_freq = ADT7470_CFG_LF;
+	u32 closest_freq;
 	int index;
 	int err;
 
 	/* Round the user value given to the closest available frequency */
 	index = find_closest(freq, adt7470_freq_map,
 			     ARRAY_SIZE(adt7470_freq_map));
+	closest_freq = adt7470_freq_map[index];
 
 	if (index >= 8) {
 		index -= 8;
@@ -832,6 +835,10 @@ static int pwm1_freq_set(struct device *dev, long freq)
 	err = regmap_update_bits(data->regmap, ADT7470_REG_CFG_2,
 				 ADT7470_FREQ_MASK,
 				 index << ADT7470_FREQ_SHIFT);
+	if (err < 0)
+		goto out;
+
+	data->pwm_freq = closest_freq;
 out:
 	mutex_unlock(&data->lock);
 
@@ -1285,6 +1292,7 @@ static int adt7470_probe(struct i2c_client *client)
 	struct device *dev = &client->dev;
 	struct adt7470_data *data;
 	struct device *hwmon_dev;
+	int freq_val;
 	int err;
 
 	data = devm_kzalloc(dev, sizeof(struct adt7470_data), GFP_KERNEL);
@@ -1309,6 +1317,14 @@ static int adt7470_probe(struct i2c_client *client)
 	if (err < 0)
 		return err;
 
+	freq_val = pwm1_freq_get(dev);
+	if (freq_val <= 0) {
+		err = freq_val < 0 ? freq_val : -EINVAL;
+		return err;
+	}
+
+	data->pwm_freq = (u32)freq_val;
+
 	/* Register sysfs hooks */
 	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name, data,
 							 &adt7470_chip_info,

-- 
2.55.0

