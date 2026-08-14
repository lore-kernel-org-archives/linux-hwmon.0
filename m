Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F248486B8A
	for <linux-hwmon@vger.kernel.org>; Fri, 14 Aug 2026 17:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786728874; cv=none; b=P6Eqs1myWJy8BZPXJZSAFBAhuC38OwLAdYvtziMc76hzQE5W0eEF21M2y82rGsVEO7L/r68Jz3W9sXR1ZaVrFf0HKG9H3qjYqTSmK8CyxutLUmDv8ig3TFZIiewNJBPumMPrkb45DrX1MI6e2zDpbl20j2JHpYvyZ/1zKDdJpzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786728874; c=relaxed/simple;
	bh=jod5R2rzftcafJwiv09+Q38USj1FrwR73vMq9DkHyyg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pFMkkg1wN2Mhy7Gee20zjwFOnME3eK0gILdVf33Ktb2GbaweHqIsBvLLzFC+8JNwyMMDLGb8VMKQDciK07SuV6g109Pbx2va33OpLRMMsJv/s/sfM72daMYAJgAVduEih/Wzv+lzvVlXq2jaS9ezRF2kIhURQMSPGrVjpMO45bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=akKePMlb; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="akKePMlb"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47f904e80eeso1244440f8f.1
        for <linux-hwmon@vger.kernel.org>; Fri, 14 Aug 2026 10:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786728870; x=1787333670; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8TSdNv+mMjSZzf1Ktp1L1v1OUzioZX6gSzEiDVYbmWc=;
        b=akKePMlbq1d47etT0YVzI4NYkKb/8W3Zsn67/3icYN4wkpwk/oIrkGJoUKoNhIPgwX
         zkwoOaopII6pSTy+2rEEvmmNiHi+mtYbEdJXy5H6kg0MGn68MkVVGXBCgfifMuN7SRrq
         Ki9xnhpZigOu4z18Uscz3Yy7HXyCBEU+IH3GUi5fm8NfkCW3vPH1w0tlcBqQ1lzhBmLG
         nUW4mluQJCyhXD/ATiyGxzRrVoXCzFigZvqm1X9wzCIP7X91FUsw29sID1f5tPLRaUlE
         ODuqS3lg3aWYe3xxFTNABG+lKJ3lW6H+3QlVZd/pqzQYafoFiWlzsSbJxO95PF0PaxDC
         D8Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786728870; x=1787333670;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8TSdNv+mMjSZzf1Ktp1L1v1OUzioZX6gSzEiDVYbmWc=;
        b=byEVp1oBe5/lbGTrcaTxyzu2We37qWJkccFo9TPczwKCGoXAhj5My0Hgqy3zRJkkDF
         SGq2bi21G6OrFn57Ws8Fi3bkvtO6dOXp22RvRZRsJtNI4lhnHxwHl1wmxW4AnoWvXmGi
         gZxK2XV9uqTw4gZwpDkKIkfMg/51O/+vov/2gzmqp5y5z0D38Yw4y7JrffIXqOGEqL3U
         ewHOBi490F3XqV98oKfeSCjlnxu3hla7KBJ/sh+RE/PVVJk53WrN+liJWsiwQQaNiKMj
         Dz5ui07mHhYfoRCxcUeJfZGi94NZrKMznFTyAGLxayP2DCU4KKcR6KDNE8mqw7nBTlk1
         udnw==
X-Forwarded-Encrypted: i=1; AHgh+RqRi4JBU4ibmzMKZFsgY+B7ge2wuppvFRVfxBmUxuODIikgFePKFr/Ypw2Ut5AT/u/wR4yCC017nBWRng==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTHPyjl6aYlEJftWdwYL/jsi9jPk+Yc4LY72DRgaSCCd2ZRWV7
	rBBSjp+DLW0G2yLGqXTT6Qpem3cJxrbscLlKF41B+8th14vdemKa8uxe
X-Gm-Gg: AR+sD12TQBi7TBGbcg6umaF++AOx8/nmbVbobu0EOGKufiq4InMp0Qiy9y/67VBFR+a
	QcB/xOdYKh3xxZRJWEk83SO4+YwPPX1gBFTMwWzxPVCn7GQG+rGF6hpReeJt0wLpnAuoX6dOKrq
	5NgCYNyISaN4C/Q3HJIJpJnCJ3KbKMXpwe8Gvht3pDo8jvyhylpGQ/8qI4DoP5Fo7IN9WeP+6iz
	NZOIIOzM1CzHHJYvLq2g2beyN8fB6p8LOK3XgdGP7vKSPljiIZKSsgsK3dkdr4DdLWbOHAfSmvM
	YQbvqg6UrT86c18HsSa5Fvz2HtaFUC07uJtv3GKQM4d9/pwTOlnBbUa+N7XfdbDA76Oe9Me+QmZ
	CRaUwVSZmxM5ItwNufZ8OLF63XtLz/STXAnarcR7/Nra61465PnU2Md46HMWOiQwNp8TL5T83jA
	pzWP7y3Gi2VwdTzbs8jyb0lQUywdO/d1dGlTCKQ0l4fhuA9QcXs2pJDsoxEo3pWxARF/jArcAHZ
	aiXyCKQkEhbnndyuiYseYS2nDaHamqm5wuX7nd/WrVk
X-Received: by 2002:a05:6000:4310:b0:47f:fe22:c141 with SMTP id ffacd0b85a97d-4816076d956mr10260342f8f.30.1786728869662;
        Fri, 14 Aug 2026 10:34:29 -0700 (PDT)
Received: from [192.168.0.32] (cable-178-148-247-5.dynamic.sbb.rs. [178.148.247.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f2b27bfsm9942694f8f.23.2026.08.14.10.34.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 10:34:29 -0700 (PDT)
Message-ID: <0e81cb71-bd88-432c-aa73-d5770cd81569@gmail.com>
Date: Fri, 14 Aug 2026 19:34:27 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] hwmon: (asus_rog_ryujin) Add ROG Ryujin III
 support
To: Arie Miller <renari@arimil.com>, Guenter Roeck <linux@roeck-us.net>
Cc: Will Smith <github@notthatwillsmith.com>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260812103532.395049-1-renari@arimil.com>
 <20260812103532.395049-3-renari@arimil.com>
Content-Language: en-US
From: Aleksa Savic <savicaleksa83@gmail.com>
In-Reply-To: <20260812103532.395049-3-renari@arimil.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/12/26 12:35 PM, Arie Miller wrote:
> The ROG Ryujin III uses different report offsets and a different
> cooler-duty channel from the Ryujin II. It also lacks the separate
> external fan controller supplied with the older model.
> 
> Add model data and USB IDs for the Extreme and EVA Edition variants.
> Skip controller commands and hide the unavailable controller hwmon
> channels for these devices. Update the driver documentation, Kconfig
> text, and module description accordingly.
> 
> Link: https://github.com/aleksamagicka/asus_rog_ryujin-hwmon/pull/9
> Assisted-by: Codex:gpt-5.6-sol sparse
> Signed-off-by: Arie Miller <renari@arimil.com>

Reviewed-by: Aleksa Savic <savicaleksa83@gmail.com>

Thanks,
Aleksa
