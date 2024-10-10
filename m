Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8AE19884C
	for <linux-hwmon@vger.kernel.org>; Thu, 10 Oct 2024 19:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728588947; cv=none; b=rnzrE6M34NHiPFXJb4nMov0mco+7kLj1tDhFv4ciYdCIp23A24SkeLLBhR2u+PjilwY1IPbAy0tQr1ZlaED+ui5fcyNKhNfyvU34ypQoJ4bezJMk1TQG1k9BqUjVoMHbgD4jE4dChoimaOmU037kJHhbYxwerNNf317w2gQZiXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728588947; c=relaxed/simple;
	bh=WzU1ghqZqd2yiJh0WUBPR9BwxV8f01nMd0AH60V34RQ=;
	h=Message-ID:Date:MIME-Version:From:To:Cc:Subject:Content-Type; b=eyDJHH7HLk2IflOjQZ/jmDtl2jh7/lYSJnUPnxgMTknIm4ox7wlxJxVTzQxw9OYIN5n1sFZ1/J8UHl2k0lkN0DkbLgnEXCTXmwYGG9anFwCVS4Y5858x9nfEKkkdkkPTULvO/5D35H8QXXXsc2CxkcWXcMA6Rq/3ajFEhHGl8tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N5Gkcdgv; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N5Gkcdgv"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a993302fa02so205527166b.0
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Oct 2024 12:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728588944; x=1729193744; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:cc:to:autocrypt:from
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3oMTuL8EANRscgiJvvz1KX0U7GD3xZLxe6kLjv+k8BA=;
        b=N5GkcdgvfrAreFTELKjmSnGFU9dyXjTqIEL0dzmnQutOLZEqucpn+dfOS6IPhyOzTN
         oZALm5dq6smAC8TOfvI0lYLUdRCfbveNkHmXhseOE8V4eXqEYvwzZ/8VH8d2+MObVgPK
         rlbB62jfztiYG9JCgX4sEQlLa+3ULGq+Vhtwk50F3KkQn2j5kgYtvKGfHN/amRBfQUU4
         xBUNgQUhoFvbSFaMErJ2fHeWdPPNtBFeNGafPvCzohh2RpXb3ybf31v8Cc/F1YenyIih
         zJiLNVbEnnqVhLlhD9Vch6sXdKMU1uiZ2tJSgVE/9SYHaaV1rLMnGzmbmbFcp0PFDD4p
         8zuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728588944; x=1729193744;
        h=content-transfer-encoding:subject:cc:to:autocrypt:from
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3oMTuL8EANRscgiJvvz1KX0U7GD3xZLxe6kLjv+k8BA=;
        b=kuEFMc/27nbFblX96z49gwSACpxhKWv6krerAyJOLl5Vu6ePITpjfnjzN9vCMkfut1
         L/Prbuish/ht7HtkM7L20Qfp5CdSvgQSZEUAwYWLigABm4UIffkPHdcquN68YtNsfD4T
         XkNO003EHMm4zF+HowYY/k3zge1J+DlzkCSPpJpxt42j+s/dG/GhGLjDw97oM5VPcNzX
         QAOYjPO8hbzalf27jbYyg1tZ6ogl8irZRsi9hs/BFVKJ8oynDozER69M6ICE5V+iFFgL
         Zyhot0vpl8tUuWWmbHByvwSWSiX2kCcagiPuYkSnpK+a/Pi4LVzzIGSvPXvtOAmN5EGa
         /hZA==
X-Gm-Message-State: AOJu0Yy54riR+OTeSKQlZ7BPlXsnaG7CbGL3BlhDsHqlIazEMYPy+vX0
	B4hSWd8RIQWdku4V9Y6VY5jobBZTMMtZekblZ0rgiq+y83XYxplVrpBvi8A8
X-Google-Smtp-Source: AGHT+IF4YdO5UiKLhzoTqw78rIIqWOz4u0a8yXEYdPv1sJI+mUkKnaIhQztBfEkKuSX8zxdaMpxasA==
X-Received: by 2002:a17:907:d01:b0:a99:368d:dad3 with SMTP id a640c23a62f3a-a99b93c95d7mr9105566b.30.1728588943467;
        Thu, 10 Oct 2024 12:35:43 -0700 (PDT)
Received: from ?IPV6:2a02:3100:ac3e:8500:8533:85c:8e6e:f61b? (dynamic-2a02-3100-ac3e-8500-8533-085c-8e6e-f61b.310.pool.telefonica.de. [2a02:3100:ac3e:8500:8533:85c:8e6e:f61b])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a99a7f24569sm130251466b.58.2024.10.10.12.35.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 12:35:43 -0700 (PDT)
Message-ID: <89690b81-2c73-47ae-9ae9-45c77b45ca0c@gmail.com>
Date: Thu, 10 Oct 2024 21:35:42 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 xsFNBF/0ZFUBEAC0eZyktSE7ZNO1SFXL6cQ4i4g6Ah3mOUIXSB4pCY5kQ6OLKHh0FlOD5/5/
 sY7IoIouzOjyFdFPnz4Bl3927ClT567hUJJ+SNaFEiJ9vadI6vZm2gcY4ExdIevYHWe1msJF
 MVE4yNwdS+UsPeCF/6CQQTzHc+n7DomE7fjJD5J1hOJjqz2XWe71fTvYXzxCFLwXXbBiqDC9
 dNqOe5odPsa4TsWZ09T33g5n2nzTJs4Zw8fCy8rLqix/raVsqr8fw5qM66MVtdmEljFaJ9N8
 /W56qGCp+H8Igk/F7CjlbWXiOlKHA25mPTmbVp7VlFsvsmMokr/imQr+0nXtmvYVaKEUwY2g
 86IU6RAOuA8E0J5bD/BeyZdMyVEtX1kT404UJZekFytJZrDZetwxM/cAH+1fMx4z751WJmxQ
 J7mIXSPuDfeJhRDt9sGM6aRVfXbZt+wBogxyXepmnlv9K4A13z9DVLdKLrYUiu9/5QEl6fgI
 kPaXlAZmJsQfoKbmPqCHVRYj1lpQtDM/2/BO6gHASflWUHzwmBVZbS/XRs64uJO8CB3+V3fa
 cIivllReueGCMsHh6/8wgPAyopXOWOxbLsZ291fmZqIR0L5Y6b2HvdFN1Xhc+YrQ8TKK+Z4R
 mJRDh0wNQ8Gm89g92/YkHji4jIWlp2fwzCcx5+lZCQ1XdqAiHQARAQABzSZIZWluZXIgS2Fs
 bHdlaXQgPGhrYWxsd2VpdDFAZ21haWwuY29tPsLBjgQTAQgAOBYhBGxfqY/yOyXjyjJehXLe
 ig9U8DoMBQJf9GRVAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHLeig9U8DoMSycQ
 AJbfg8HZEK0ljV4M8nvdaiNixWAufrcZ+SD8zhbxl8GispK4F3Yo+20Y3UoZ7FcIidJWUUJL
 axAOkpI/70YNhlqAPMsuudlAieeYZKjIv1WV5ucNZ3VJ7dC+dlVqQdAr1iD869FZXvy91KhJ
 wYulyCf+s4T9YgmLC6jLMBZghKIf1uhSd0NzjyCqYWbk2ZxByZHgunEShOhHPHswu3Am0ftt
 ePaYIHgZs+Vzwfjs8I7EuW/5/f5G9w1vibXxtGY/GXwgGGHRDjFM7RSprGOv4F5eMGh+NFUJ
 TU9N96PQYMwXVxnQfRXl8O6ffSVmFx4H9rovxWPKobLmqQL0WKLLVvA/aOHCcMKgfyKRcLah
 57vGC50Ga8oT2K1g0AhKGkyJo7lGXkMu5yEs0m9O+btqAB261/E3DRxfI1P/tvDZpLJKtq35
 dXsj6sjvhgX7VxXhY1wE54uqLLHY3UZQlmH3QF5t80MS7/KhxB1pO1Cpcmkt9hgyzH8+5org
 +9wWxGUtJWNP7CppY+qvv3SZtKJMKsxqk5coBGwNkMms56z4qfJm2PUtJQGjA65XWdzQACib
 2iaDQoBqGZfXRdPT0tC1H5kUJuOX4ll1hI/HBMEFCcO8++Bl2wcrUsAxLzGvhINVJX2DAQaF
 aNetToazkCnzubKfBOyiTqFJ0b63c5dqziAgzsFNBF/0ZFUBEADF8UEZmKDl1w/UxvjeyAeX
 kghYkY3bkK6gcIYXdLRfJw12GbvMioSguvVzASVHG8h7NbNjk1yur6AONfbUpXKSNZ0skV8V
 fG+ppbaY+zQofsSMoj5gP0amwbwvPzVqZCYJai81VobefTX2MZM2Mg/ThBVtGyzV3NeCpnBa
 8AX3s9rrX2XUoCibYotbbxx9afZYUFyflOc7kEpc9uJXIdaxS2Z6MnYLHsyVjiU6tzKCiVOU
 KJevqvzPXJmy0xaOVf7mhFSNQyJTrZpLa+tvB1DQRS08CqYtIMxRrVtC0t0LFeQGly6bOngr
 ircurWJiJKbSXVstLHgWYiq3/GmCSx/82ObeLO3PftklpRj8d+kFbrvrqBgjWtMH4WtK5uN5
 1WJ71hWJfNchKRlaJ3GWy8KolCAoGsQMovn/ZEXxrGs1ndafu47yXOpuDAozoHTBGvuSXSZo
 ythk/0EAuz5IkwkhYBT1MGIAvNSn9ivE5aRnBazugy0rTRkVggHvt3/7flFHlGVGpBHxFUwb
 /a4UjJBPtIwa4tWR8B1Ma36S8Jk456k2n1id7M0LQ+eqstmp6Y+UB+pt9NX6t0Slw1NCdYTW
 gJezWTVKF7pmTdXszXGxlc9kTrVUz04PqPjnYbv5UWuDd2eyzGjrrFOsJEi8OK2d2j4FfF++
 AzOMdW09JVqejQARAQABwsF2BBgBCAAgFiEEbF+pj/I7JePKMl6Fct6KD1TwOgwFAl/0ZFUC
 GwwACgkQct6KD1TwOgxUfg//eAoYc0Vm4NrxymfcY30UjHVD0LgSvU8kUmXxil3qhFPS7KA+
 y7tgcKLHOkZkXMX5MLFcS9+SmrAjSBBV8omKoHNo+kfFx/dUAtz0lot8wNGmWb+NcHeKM1eb
 nwUMOEa1uDdfZeKef/U/2uHBceY7Gc6zPZPWgXghEyQMTH2UhLgeam8yglyO+A6RXCh+s6ak
 Wje7Vo1wGK4eYxp6pwMPJXLMsI0ii/2k3YPEJPv+yJf90MbYyQSbkTwZhrsokjQEaIfjrIk3
 rQRjTve/J62WIO28IbY/mENuGgWehRlTAbhC4BLTZ5uYS0YMQCR7v9UGMWdNWXFyrOB6PjSu
 Trn9MsPoUc8qI72mVpxEXQDLlrd2ijEWm7Nrf52YMD7hL6rXXuis7R6zY8WnnBhW0uCfhajx
 q+KuARXC0sDLztcjaS3ayXonpoCPZep2Bd5xqE4Ln8/COCslP7E92W1uf1EcdXXIrx1acg21
 H/0Z53okMykVs3a8tECPHIxnre2UxKdTbCEkjkR4V6JyplTS47oWMw3zyI7zkaadfzVFBxk2
 lo/Tny+FX1Azea3Ce7oOnRUEZtWSsUidtIjmL8YUQFZYm+JUIgfRmSpMFq8JP4VH43GXpB/S
 OCrl+/xujzvoUBFV/cHKjEQYBxo+MaiQa1U54ykM2W4DnHb1UiEf5xDkFd4=
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: [PATCH v2] hwmon: Add static visibility member to struct hwmon_ops
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Several drivers return the same static value in their is_visible
callback, what results in code duplication. Therefore add an option
for drivers to specify a static visibility directly.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- improved is_visible description
---
 drivers/hwmon/hwmon.c | 19 +++++++++++++++----
 include/linux/hwmon.h |  5 ++++-
 2 files changed, 19 insertions(+), 5 deletions(-)

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
index 5c6a421ad..3a63dff62 100644
--- a/include/linux/hwmon.h
+++ b/include/linux/hwmon.h
@@ -368,7 +368,9 @@ enum hwmon_intrusion_attributes {
 
 /**
  * struct hwmon_ops - hwmon device operations
- * @is_visible: Callback to return attribute visibility. Mandatory.
+ * @visible:	Static visibility. If non-zero, 'is_visible' is ignored.
+ * @is_visible: Callback to return attribute visibility. Mandatory unless
+ *		'visible' is non-zero.
  *		Parameters are:
  *		@const void *drvdata:
  *			Pointer to driver-private data structure passed
@@ -412,6 +414,7 @@ enum hwmon_intrusion_attributes {
  *		The function returns 0 on success or a negative error number.
  */
 struct hwmon_ops {
+	umode_t visible;
 	umode_t (*is_visible)(const void *drvdata, enum hwmon_sensor_types type,
 			      u32 attr, int channel);
 	int (*read)(struct device *dev, enum hwmon_sensor_types type,
-- 
2.47.0

