Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAA73644BC
	for <linux-hwmon@vger.kernel.org>; Wed, 18 Mar 2026 20:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773864212; cv=none; b=dKpAUqgLWshDj4dv+KkL2NWGNEdBDE5QxfsrQt9w/B5Wl1xMoTwmiLGsnXB7DP3wJUQVc2HEptDqpVvQY45lU2XMKCKc2xh+B3fqoqh8PEc7KQtZB+rHhOCntUdpNr8NNtIYdvDocyVgIDX1WF4j5VjmRXclKROXd0szWzI3VkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773864212; c=relaxed/simple;
	bh=Mn2lWQS7ei0UHnIv8m0YFo6PIODlXriq+9GlB928c/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sq5DwufyG/MFKoaRiaGCf8UYFEH/Nbe1nt4w6bSy2xBegIdgq21hIWZf/1sPXdzs+cpBEKw3GQ61Rhvu7QUAzroAO7SlRN0ypSqlB4ZNhHmP5fgvCZaf7azyFAUM3Ve9x5+LTRTD+ZsbU/Np/BRsw8hDyARh5EL4XBAg/y5wFsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OwiNPjyy; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OwiNPjyy"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-485409ab264so1162485e9.1
        for <linux-hwmon@vger.kernel.org>; Wed, 18 Mar 2026 13:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773864210; x=1774469010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mn2lWQS7ei0UHnIv8m0YFo6PIODlXriq+9GlB928c/g=;
        b=OwiNPjyyTXRp00k+cXuusiEu22o1mZjlCo+VKENocNkL6Bj74dMr2OwBOZggIPFgwQ
         ozSiGAT+HfijhgKMDotdHf5lKuBkFhCz5q7w+w+SP/lyl2cpAHuHJyLgU/aeI/AMrqaq
         CPo8aORBkir2iX4xVBf3ab8T/8hrlkSZD3T9l/oSdW6xfitl1AHUkc5FI0YNXPGCp6EJ
         0gyN981uRO2aX3DvkfdzC4tqAnJQi+jVOTIHy9a7YeGBWd5p9H3xYugaTktgUDfAPTi9
         0MX7hCeq205IPnG+GfmxMfU1KSqbmX+wo1oDwkuoKAdR8/XlDiPfKgM1OBCCzQuArpHZ
         A5mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773864210; x=1774469010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mn2lWQS7ei0UHnIv8m0YFo6PIODlXriq+9GlB928c/g=;
        b=cX/o3onm/SdsWbP97Q19XfnopsEE1mkOHjdukRKTIDCcMD3lQOX2GQIgXYcHkLp4SQ
         BmXZohka0Kby+shf6UB55EQcuMkghMK82uuAVNJwoQhsfsZNZe5WEObUsqqloJpUPUKF
         FkBsoBfHOF9LinTuxIJilIAKl5hHegurJlDvTjv9Sh8ZFC1Xcu21OPsBQKmpv7JJXdIO
         GppI2GEO0s9vjuIeX2bZl2E8z7mv+cAvlrnTE/CkDlnag7uBWYPRvhLhiUdY/9M+Hgyr
         YQaK3bv/00K4wPzgWPyohJtuNQgM5gdF5nMLmFjX8MJaRCn5v28KD23okTKowXX7Qbug
         Z8Ow==
X-Forwarded-Encrypted: i=1; AJvYcCVhDMezivUc5EWGxNmiO2/rRSq2NHhvKX7AIWKR/yClR3QjWxo2hWIBF15RAof6M9cHHN6BEVvlfP5YgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCK6Tj2Bs1enmKOcTti4WKov2sJ8zEUcwNhACgipAH4VPNYnXv
	N4PPp1HdOoJpZ7qFGGvovdjT5gnMakiudEwzfJvU6SLS+HFfbLm2E1ZY
X-Gm-Gg: ATEYQzxFl/NCX4FAoNi/ZETuQTAjErsp6bT3/Ysx9H0hoUbX3Cor3UdpAEs+EC0C6BR
	ZeHdqLEkjN2uFnpUl8GzjVPP7CW9bAsGJkLvOUu5pnSeLQy//eJ1kHhtg8hng3oEP3RMi7aDSic
	3paBHIJWBeZUXvzljjkEIjORxrz1eL7YTMQwz1q3jVu7q7TrHPTV10fzk5O6Cof1nTQra2/O/rl
	YNKJWDqTX9I2vVsCWTiHRQMSBOjify9IwxMbumNRA9Qzocw5T+7q2ZmSoHuV+Fguk95Wkyz1J8P
	H2KJUC0zVXn1EwcFX8552TLpsDbFlTO2cq8FpzcZLOLh51m20vdDC6hMPA4NeSWkg/90geYrTyx
	Ynqwmj7omqG+sJ48B9RIt1eTTWkqmIXaOagB/sNWfkrJ8GmCstpiyW2nY7ZsgnnqaH8I5Gw+VRg
	7iaWMjtPczoUqhfVa9UAz5vUcKu5yxxyod1fpdmgN14NcV5kiXX2uGCwnuiaTA5xiWbjCu3H3/
X-Received: by 2002:a05:600c:64c3:b0:485:38f1:5cec with SMTP id 5b1f17b1804b1-486f8b324a1mr15085255e9.7.1773864209194;
        Wed, 18 Mar 2026 13:03:29 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.232.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f45d8e3dsm27444815e9.0.2026.03.18.13.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 13:03:28 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Flaviu Nistor <flaviu.nistor@gmail.com>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: lm75: Add label property
Date: Wed, 18 Mar 2026 22:03:24 +0200
Message-ID: <20260318200324.4365-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <e82aefd4-384e-43e6-a830-c7728f642ae2@kernel.org>
References: <e82aefd4-384e-43e6-a830-c7728f642ae2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 14, 2026 at 10:50 AM, Krzysztof Kozlowski wrote:=0D
>On 14/03/2026 08:48, Flaviu Nistor wrote:=0D
>> On Fri, 13 Mar 2026 14:26:35 +0100, Krzysztof Kozlowski wrote:=0D
>>> On Wed, Mar 11, 2026 at 12:58:07PM +0200, Flaviu Nistor wrote:=0D
>>>> Add support for an optional label property similar to other hwmon devi=
ces.=0D
>>>=0D
>>> I do not see any support being added here.=0D
>>>=0D
>>> Subject is not accurate either. You did not add the label property.=0D
>>>=0D
>>> Best regards,=0D
>>> Krzysztof=0D
>> =0D
>> Hello and thanks for the reply.=0D
>> I probably did not use the best description and subject name, =0D
>> I wanted to be linked to the other patch in the series).=0D
>> The label property is already added by you via the hwmon-common.yaml.=0D
>> I will have to send out a v2 for this series so I will change the subjec=
t to=0D
>> "Add examples for label property" and also specify in the description mo=
re clear=0D
>> that is just a simple "Add label property in the two examples."=0D
>=0D
>Your commit msg must explain WHY you are doing this.=0D
My initial intention was to make sure that dtbs_check is not generating err=
ors,=0D
but since then I got to understand that the example section is not actually=
 used=0D
during the validation of DT source files.=0D
My second intention was to add the label property to the example section as=
 a good=0D
practice, but I also have seen that this is not a general rule. As I unders=
tand=0D
this is not a mandatory change, I will drop the binding patch from v2.=0D
=0D
Best regards,=0D
Flaviu =0D
>=0D
>Best regards,=0D
>Krzysztof=
