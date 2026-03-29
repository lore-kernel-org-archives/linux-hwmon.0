Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23AAA3A1B5
	for <linux-hwmon@vger.kernel.org>; Sun, 29 Mar 2026 05:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774760443; cv=none; b=qbVCCLPHNtvay1b6HIs6hMvNSe32/qo0QLIHZolfFVb6fm2eh5SDqT4oSwFIRlRrF3wGQe8VO1SCJqY/TiG5XMmAw5z8ZDm+75GLwjYqCWKGtDuZwPLOjrXcDJCsHfZaPcwcE7gdBhIM6xb1BARbzBmMQqN5aQ0yJ/Ii8DrBdWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774760443; c=relaxed/simple;
	bh=4DY5/9rnXYqzghJED76UNN2L9JwFq/I+6HIlK/oTu9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cf/G/Mv0ju3eUVU1tLU5m+YxNzMA2cobSorXBq3St/XQ1E29UBREGeUqKoIQx3Rq6bhRPqKGESMPo8jCTTsUZaDM0WfKIgPAvH3sNlPSi4CHST/yQ9chTZJIEcJIKZCRL5Zyw1PeNPsPKZz2pKLbYTVnNSfZxUju0cY9bJlqlF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F7DsDrl0; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F7DsDrl0"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1271257ae53so3571741c88.1
        for <linux-hwmon@vger.kernel.org>; Sat, 28 Mar 2026 22:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774760441; x=1775365241; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qLBf3VpXlanIYFVKTRazomaXtbgOLJXSGdrPEjAl+SY=;
        b=F7DsDrl0JFFzI7jKhBDD+aZ78Vx13acPpaoks4z6PDYAxZ16/GCTHRqG/tyWI3C4FV
         zqTqcoMSJFJcYKD3UzLe0x9jmAm2J2bkU4B2re4DVZmS/H8lSc5bm9Ws07rS+l5GWCXF
         tFWPgup05DW7BbJcChCMJItzxLeXnSJ5vQpZmv1AjdyRr+XFlQyi9Qtot3Buhs6zaMtm
         KU9ALV57dE9H/daK5p+idfDfGYsX9J4eMRYRAUuFuki0qaX7oCFUX6GQNO3y/RnI39mh
         Fa6rZQvhijtsg/jf9wjZ2k0zjxHZuxsga7QJUGidqFO8jCmre+bYSSFNr0vtsT5usnmf
         oq1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774760441; x=1775365241;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qLBf3VpXlanIYFVKTRazomaXtbgOLJXSGdrPEjAl+SY=;
        b=hXK972QdgsbPdXyweTWz9TNsBiWZ7mZyW19ijOG4t7OMjREvRNnfVcc90xKMhKb1yw
         CTGfudAi3ZfZuhD6/+bhLhRko2wgZW5jkyEZqyFoKdAZ/AAVQftBpsGNojHwEEMI/gIj
         VbJ7hRT0H5KaomBSfXi/Wa0hgyYoybIJ4CefB3NQ/WilyRLXKbjnjE7Lc0buuX382Qkk
         KsTSAq79o82Qsk3EBg31nIzmd3Z0Pb7f2O6XrhVNeYaQc5awW9Sr/gdm3UwgiyfXJ8j7
         Ef+Gr3K11EQEAUGfGLCReyfQ4RaCtvJtxzU4qOm/DORVkuzoXSkfQ4CQVK6bUlSU/7lZ
         t/sg==
X-Gm-Message-State: AOJu0YxNiR4Lmgve5ejpqkTC7Z61yNRWly8tECVzm37RZhVY6dCuOYt3
	vo1sNBMyze0yODP3Eyvbt4Swoi6UKqZ1Sj/uqHdM+tIiEYI4RXXNOO+n
X-Gm-Gg: ATEYQzwwnyuVIQ6H7k2Y8pzzzRNu/hn83tsPjuqaOAPaOMq93C+KKArHQczKUWD4UwM
	vOz6KJTg+/fmjlxDaK+N4ff0y9WL8hfqcHxIsh999Gs9wgnCKv95ZIjzf5LHJgXc9GifpVZ25TP
	rRfUq0Okdxk3rffZcZ5mPDG2md6NTCacRgv4WZwfqXZolbWa9HaLz/Ncoqy3rnwFucNRoVwijDI
	W4xDhmTXJk6r+On1GWb2up2i1OYVdA8jt3KnndNMEURaUoW7uy0SeXRcT0y3iZXbAnBXh/K869d
	CCMpP7PiUgy3yuPSKcbVT1Z9mkikMmz6QH29YXYHxU6A/59qNwxoT/qD2HPe5HV2kbgdLPgm9kK
	kZIwLp3ofYcwQyZ9NV51RBD011FA8an66SYo8YGFQyvNl8PkpVt6F0pRiUezvpiAjn2fH5NzAm9
	quYO72LfiTynaVR5CGDfPYQWEHwSg=
X-Received: by 2002:a05:7022:458d:b0:11b:9e5e:1a40 with SMTP id a92af1059eb24-12ab287d8aamr4250785c88.15.1774760441151;
        Sat, 28 Mar 2026 22:00:41 -0700 (PDT)
Received: from [192.168.1.30] ([115.96.68.45])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ac4a0fa8dsm429205c88.15.2026.03.28.22.00.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Mar 2026 22:00:40 -0700 (PDT)
Message-ID: <9c7b873d-8797-4fa1-ab44-2599b2b02f4e@gmail.com>
Date: Sun, 29 Mar 2026 10:30:36 +0530
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] hwmon: (ads7871) Add mutex to serialize SPI
 transactions
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 shuah@kernel.org, me@brighamcampbell.com
References: <20260328182015.220298-1-tabreztalks@gmail.com>
 <20260328182015.220298-2-tabreztalks@gmail.com>
 <f158d290-69b5-46bb-a49d-a6162d39e2a1@roeck-us.net>
Content-Language: en-US
From: Tabrez Ahmed <tabreztalks@gmail.com>
In-Reply-To: <f158d290-69b5-46bb-a49d-a6162d39e2a1@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/29/26 08:46, Guenter Roeck wrote:
> When using the with_info API to register the hwmon device, the subsystem 
> already
> serializes sysfs accesses. The next patch converts the driver to use the
> with_info API. Pleas explain why the extra protection is necessary.

Ah yes. I originally wrote the mutex patch to fix the race condition in 
the legacy sysfs code, but totally missed that migrating to with_info 
handles the serialization for us natively.

> Sashiko has the same feedback:
> 
> https://sashiko.dev/#/patchset/20260328182015.220298-1- 
> tabreztalks%40gmail.com

Separately, Sashiko flagged a pre-existing bug where 
ads7871_write_reg8() passes a stack-allocated array (u8 tmp[2]) to 
spi_write(), breaking DMA.

To fix this properly, I need to move the buffer into the device's 
private data structure. However, doing so requires serialization to 
prevent concurrent reads from corrupting the shared buffer. Since moving 
to with_info provides that serialization, my plan for the v2 series is:

- Patch 1: Convert to hwmon_device_register_with_info (which natively 
serializes the driver).
- Patch 2: Fix the SPI DMA bug by introducing a shared tx_buf (now 
safely protected by the hwmon core).

I will drop the custom mutex entirely and send out v2 with this structure.

Thanks,
Tabrez


