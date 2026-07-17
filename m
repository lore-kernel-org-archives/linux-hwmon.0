Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC6B3DA7CE
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Jul 2026 07:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784271987; cv=none; b=oAr3tnK7YMVTdWSheZGX4AUnhIkC5u+RDHIZn3j0YUHCA4+EhTs4+c4fW14N+fjWw7kmJb+R1DDbv0NPi+pBSdjOlFvm3wiBH/lHnSxEVrpyCtmZ4+Oy08SSjU/crJWKaE8lFg7PY4q6EOGuwCoWURI5WRFeJtNXASCBGJyGMuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784271987; c=relaxed/simple;
	bh=3d+U5BxP8GFfkZa3tznME4j9DaN9aInz1BWWs2tEgR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z09ubLvwax1JoStU8YwiqbTIqFq2At/IaqUGRGyNFlfw4YMGCK6nLwJZbMKoYuf57e6sKbVGV+SYD5LwBWR5P0gN13jqLyQ2Lr4YW8M9lP4cAvdRF1jPeWwpADC475bKSQTeMm3Xd1g9FFQp0WORYNREqz8IqeUz8bYh6ZSDF9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iSw9Oy1V; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iSw9Oy1V"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4799b3f7c83so5361517f8f.2
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Jul 2026 00:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784271982; x=1784876782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BOdo7TJO/G0vwAKTbM1CqLhpNvaQUJdtcHZEWHaov1o=;
        b=iSw9Oy1VuRYW332gCNVxVTCMf2MSl3mrxBVsLPc0PfoJehtuqUfyeQ9xqd9FNJrq76
         rHsww5qF4DMD0rbo5x9laJlPZpKSnhf7L4k/GmNXFeh4Emm6Qqlp9+nYQ2jLlLnbSueg
         Ka1GRzHpW+cILEipaVqI7PVORe7Br0j53CHN0V8nUnYIKnLNsEfMtdjE5NoZftp4RL/d
         1a7HZR9tEUHd4Lh9e58PvWeIGz+j4NfwxYUYtGWt8etNs0Vh1YK44XCWaFkEoDAqAXQ/
         9hnVybocLaCexzKIpNAMfbO1aU5l+shkLR8Io1JQAEiqoCv1eQep3JmOSRNWOUrJb6fW
         4mnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784271982; x=1784876782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BOdo7TJO/G0vwAKTbM1CqLhpNvaQUJdtcHZEWHaov1o=;
        b=K3212YlNHzaNaO+StAsu9YTm/3M2Ehh7/sSHDzyOYygcsvpD6TufObG9mubBj+yagy
         q5rcFe9hKw71ygCjh9+8WNtpG4H6hJebMQFldLkxaQV1Z5UxVH/WayvHWROoJRNTQLPJ
         Y23BiEHsSNvGNzmUIiPnn8rFyOHHGmWZ/dDzq4+2Tn3xxe3aByuJ9TjoQB72NrE/24k9
         ypKG+vIzYphiLeLJ5UxxpPPtTE9kxVFjWr2CXGlSUtQqjpp/S9EVWwFenbdVr79HSI0R
         JO2WtHhXnXbX/+bxCHdUVynEck/gbmWhax411iF0e1sKGiMFoXeZbF8Zw6CF8eYZv4PT
         EMgg==
X-Forwarded-Encrypted: i=1; AHgh+RqVj0ci6WlQpcO1mPD5bC+vWwmcOpJlcTjkmAc3h+vT9cAm48Gd2nQkWQm5S4tSsSVddL0cKN9n65lTbg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx08eHVOwwG7jp43vvvV8soowNCg5y8qbEIZWP1qnGMpYsfgMpd
	q/OS/Mu9AaMCm1fgPwu+gPIvashp2dnnkiegS5Kznn4ZHO9bOj1zyICRKgjsRQX5
X-Gm-Gg: AfdE7ckeA16ob9m0dAXKiehpRvUYQWFV5qjfNsRKdV+sYUrGwmIpRr4s03/OwS0HCfi
	pfG69tKxvuIQwIMlG0tBjqima+Mx3f8OThzJNGjq7OtcuROPqI4YkJEB9RnRzUChv2BvxgLG7kL
	njzqZcFiGBuZVfYA62HIUhyaAuD6mMAVDo3XzIT06CID0MAzsrYCGhuZI8/vEHVoAY9+lgwM0Di
	TWuuekKEPxcN7k8WNw5KS6fuIXv06a3Q54oocLURjuIqit537M0nR/0JrypmOCwTISTeSVXGAF1
	B0prgtvdObuWFbW/Vq4rUF4OWZ5TbjGU6hLPEn6o7LjpXYaHHbcAQ1yU5IBVe6KjuxtYfgLMso7
	zt0gXT8G5H5MNUbG3OyHkQYyLF5qthKRmc3yaK8SyRGkOWLESSmqD6jIIz1pmV3rvCJfAPuf4gq
	w80folhcrCH4NWEMvmGDV0m5T83c8Nx99ZIz4SSWrJSLOQEAnFjkkyAUA=
X-Received: by 2002:a5d:5f54:0:b0:461:e27d:5690 with SMTP id ffacd0b85a97d-47f6230b5e8mr1726666f8f.26.1784271981556;
        Fri, 17 Jul 2026 00:06:21 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([93.122.248.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63dc25basm1522326f8f.0.2026.07.17.00.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 00:06:21 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] hwmon: (lm90) Switch channel parsing to fwnode APIs
Date: Fri, 17 Jul 2026 10:06:14 +0300
Message-ID: <20260717070614.6492-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717064947.824201F000E9@smtp.kernel.org>
References: <20260717064947.824201F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 17 Jul 2026 09:49, sashiko-bot wrote:
>Thank you for your contribution! Sashiko AI review found 2 potential issue(=
>s) to consider:
>
>New issues:
>- [Low] Incompatible pointer type causing build failure
>
>Pre-existing issues:
>- [Critical] Sysfs read triggers NULL pointer dereference via uninitialized=
> hwmon_dev
>--
>
>--- Patch [1]: [PATCH v2] hwmon: (lm90) Switch channel parsing to fwnode AP=
>Is ---
>commit 3d5d792e5529b3545ccefc21f7dfd9c2acecc999
>Author: Flaviu Nistor <flaviu.nistor@gmail.com>
>
>hwmon: (lm90) Switch channel parsing to fwnode APIs
>   =20
>This commit replaces OF property handling with fwnode APIs in the probe
>function to read channel properties. This improves compatibility by no long=
>er
>limiting it to Device Tree.
>
>Link: https://lore.kernel.org/all/20260713190659.4511-1-flaviu.nistor@gmail=
>.com/
>
>> diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
>> index 4b9c0ccdf2609..7d4b8e61bec51 100644
>> --- a/drivers/hwmon/lm90.c
>> +++ b/drivers/hwmon/lm90.c
>[ ... ]
>> @@ -2701,27 +2701,27 @@ static int lm90_probe_channel_from_dt(struct i2c_=
>client *client,
>[ ... ]
>> -=09err =3D of_property_read_s32(child, "temperature-offset-millicelsius"=
>>, &val);
>> +=09err =3D fwnode_property_read_u32(child, "temperature-offset-millicels=
>ius", &val);
>
>[Severity: Low]
>Will this cause a build failure or compiler warning?
>
>In lm90_probe_channel(), val is declared as an s32, but it is being passed
>to fwnode_property_read_u32() which expects a u32 pointer. This pointer typ=
>e
>mismatch can trigger a -Wincompatible-pointer-types error in modern builds.

This is absolutely true and I can't understand how this got into the patch since
I have test is. I will send a v3 correcting s32 to u32.
Sorry for this!

Best regards,
Flaviu
