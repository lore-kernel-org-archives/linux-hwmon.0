Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78C21E04A0
	for <linux-hwmon@vger.kernel.org>; Wed,  9 Oct 2024 20:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728504440; cv=none; b=XQN/S5j5itb2QQB59H/GH4KYp4z57jdtd/BpV/P//VDdML8Nk+RHYCwZYMDGXrlJyvLyn1CV167UIcCdYnTDpgIPvIVMxfmTd9YFb1pGTelpRaeec+QXuzPp526RraZ2wYuZk6JwK562+4A+pZH95NjczJn2VoJHiMQ4F47iK0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728504440; c=relaxed/simple;
	bh=N87+sndzptkD989mlFOoFvhj/kb9LAtHqe/5aYbp1Cs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Z0wC45GrCnxgh4nas2/p3FUL3GZxeBY7dw8J91d8+bDpTgJYtPCPo8m9ryHAF4VWlv+lKyyKd9RVZBK5kddoIKiKpI98Ovu6CUp6ymHE89ADLOd6/L7isRSRacV3J/+/fVqtGATrt6cSroiL2RTUMAv5y3zajw86fFw6BHa5ax8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=foaA5qSF; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="foaA5qSF"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a998a5ca499so26672666b.0
        for <linux-hwmon@vger.kernel.org>; Wed, 09 Oct 2024 13:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728504437; x=1729109237; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lZEtzviNPDfMgnzBnHlmzKZlqYcXcxWCLlGUAEuMExk=;
        b=foaA5qSF5K820MkBrQJ1RRAzpZ2yh/HmQciKOPnF62gI7wgrPrTOveAgXZhQZrLcs6
         UyvP13HP6HF4WKv1uRnMidxpA6Ytcj2WXrmk3906RSn9ag+5TjIt1R1Q2K6KOIGthrxU
         bzCFxqgl2PVcLRxHTbQPzpVl2NUHIOmtSnwGfDWdKH7fZRl8EPGt0/TpLzbPY4PbEQxw
         19Z2yfeeWRdTfe8jrkwx2UIhNGhbGIvPVDWo4bHoCg5yIPTe4Z0gcd6WQDy54IPjggmB
         9a3KmCj6jpec0wL9pM/gqths5M/k6JAx2Zal5TDGk993mpvLleOvGKobNpbWzaFdt08b
         Mo4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728504437; x=1729109237;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lZEtzviNPDfMgnzBnHlmzKZlqYcXcxWCLlGUAEuMExk=;
        b=tVfu+lDfceN7bPOxCaorzU2AwEO1s0z8eAcLJy09ju5yrKju/zYfz4EQVVg7cjdy+z
         BR/huwcc0rYo+OZ28AbpROwYNTvKLmtzM//TCzgBPdAPua3FPqg9BlWgieqBzBLhwwJ4
         jOtqrzAHxCMOwoUFgaYQB0jLHMVyqe6kNeDHWp+Dm8nhfkvr71OlPwtjlmSzTtBf5YNP
         u4qr2V3y1Fy7Oqfg9b9/rOyO3b6aw1y5l/TAjXrQJNwOGdJLtKC6poXVmAkwxvuXetrb
         4KWyB5NUAvQ1EIvTT3IbFFGIjI8ILMtBF/0tMGPS3Dhx8yJi07NIexaOcJLeQ21QbDat
         LtJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBeYYAZ7hP57Vi9ucV6HUhup5HZDdGiejeUPtrjOf6RM7/aVFDHwDPElN4dhZ/9QIvOdRSZ2OfLTVV+g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw26XbLY/3Bfmj6y6FmzHvd+t8zU3vhST6Xo94UyDa2N7hFk3Bk
	zrkzqlmSQJ8BYUDcSfVFelb+f3LdStuqCtc3ZNlp9h4quekuWcIL
X-Google-Smtp-Source: AGHT+IHr+GpFMxEYCu943hvq5llxkSFCkCSemX0T21vVg8cBSMkoT/V863crROgR+RrHPsvbrZuKPw==
X-Received: by 2002:a17:907:e8d:b0:a86:9d3d:edef with SMTP id a640c23a62f3a-a998d10db4dmr325282566b.12.1728504437080;
        Wed, 09 Oct 2024 13:07:17 -0700 (PDT)
Received: from ?IPV6:2a02:3100:b338:6300:ac71:eea5:34f6:504b? (dynamic-2a02-3100-b338-6300-ac71-eea5-34f6-504b.310.pool.telefonica.de. [2a02:3100:b338:6300:ac71:eea5:34f6:504b])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a9955cd5207sm460255766b.13.2024.10.09.13.07.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Oct 2024 13:07:16 -0700 (PDT)
Message-ID: <544b1765-312b-4ad2-9eaa-71994883156d@gmail.com>
Date: Wed, 9 Oct 2024 22:07:15 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 6/9] hwmon: powerz: Use new helper hwmon_visible_0444
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Tim Harvey <tharvey@gateworks.com>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Xu Yilun <yilun.xu@intel.com>,
 Tom Rix <trix@redhat.com>, Jonas Malaco <jonas@protocubo.io>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Michael Walle <mwalle@kernel.org>, Maximilian Luz <luzmaximilian@gmail.com>,
 Ivor Wanders <ivor@iwanders.net>
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 linux-rpi-kernel@lists.infradead.org,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <3aecbfc5-e11b-4425-9c6b-88dac2d32945@gmail.com>
Content-Language: en-US
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
In-Reply-To: <3aecbfc5-e11b-4425-9c6b-88dac2d32945@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Use new helper hwmon_visible_0444 to simplify the code.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/hwmon/powerz.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/hwmon/powerz.c b/drivers/hwmon/powerz.c
index cfb635f94..fa66a6471 100644
--- a/drivers/hwmon/powerz.c
+++ b/drivers/hwmon/powerz.c
@@ -54,12 +54,6 @@ static const struct hwmon_channel_info *const powerz_info[] = {
 	NULL
 };
 
-static umode_t powerz_is_visible(const void *data, enum hwmon_sensor_types type,
-				 u32 attr, int channel)
-{
-	return 0444;
-}
-
 static int powerz_read_string(struct device *dev, enum hwmon_sensor_types type,
 			      u32 attr, int channel, const char **str)
 {
@@ -201,7 +195,7 @@ static int powerz_read(struct device *dev, enum hwmon_sensor_types type,
 }
 
 static const struct hwmon_ops powerz_hwmon_ops = {
-	.is_visible = powerz_is_visible,
+	.is_visible = hwmon_visible_0444,
 	.read = powerz_read,
 	.read_string = powerz_read_string,
 };
-- 
2.47.0


