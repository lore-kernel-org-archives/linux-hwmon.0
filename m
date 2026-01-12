Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65144387371
	for <linux-hwmon@vger.kernel.org>; Mon, 12 Jan 2026 18:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768241848; cv=none; b=S78tpHmbEzHlJNET4/HvevgU6+RtCOKoGSO4iSUQ4mtZGjDZkwM4nIzpzJP+KbRQsrlv0AE+L7kqAYQK16bql2+J+HfuogGuLwymJPiDAOHX+gb5m6jmF9mPGrA0abWTUhnYzZyKzrgqpUoY767pFIwMDbeBqRdgypczJCqfvGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768241848; c=relaxed/simple;
	bh=HZWb8NTGhICIn9r0/1N4Kr1/FZT+Sn4S6zblZ/laKMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tVG/aUXE+p94T4DRNvRvoKbPyLGd2rH356d9hpMm81Q9+bF0hCpVU5i+gA6KulYTeyAH+7LxlFQcTxaVOfQn6FOfJjPaginw4enuSeid/JXd71S8FSW40mYKbn8FO6h0U9E8MeOK77tRlUy8WpDy9ZYaZ8ki5s/p8Psszkd4bJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GjUYMmq6; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GjUYMmq6"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a07f8dd9cdso47329885ad.1
        for <linux-hwmon@vger.kernel.org>; Mon, 12 Jan 2026 10:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768241846; x=1768846646; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EtGlqg5k06i3Wt6eqTAnbJ1drNbM/2MSyECysgkVtSA=;
        b=GjUYMmq6ihpSNNICeV8pA9aAnEwbo7l5+C1FcMLtFJkog3GMNjZS4b+3gKO2I+kcAG
         G5xp1Z9cm3cNSrgWtcknFTtzEsEU6QHytB+8jouGSBN3HwUtlL3uvF3fAfuUIQlwJ6dx
         xMDiVzBIH4uBIYyb7Vay7ibt9JmDcXKj/UYI7++pjCiuHkPEaT3kK2dARWiBR0HSbQkU
         +0Y3xZgv5VJnja7qmmSwyl9dvO3Y+l7fc57oiZKCkexMUxS7jHlP+tymQ5PbsutffLVH
         XrgXGQsx3xMDY8/polrh2VZ8jCg28y0A1gfT2m7xpPEUoYwX7tWJXIZKjnHP4qeNiNip
         nBCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768241846; x=1768846646;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EtGlqg5k06i3Wt6eqTAnbJ1drNbM/2MSyECysgkVtSA=;
        b=ad95O6Ag+oVhhWKeinXLXmCBKdcJeX7QeD95KXMEZOw5DodbVKqLX10H6zf2jm23eO
         uhkwgpjZAWzCZB9Hwbn/edHlKldQHASizrPUMyofgTdjf6h9WxK7tWd/V4lxJOjzu92m
         SaaDWHNGD05upsAXmIQIag0mufeR5iuWwmU7KE/z0Wl8YNaI2bVHFzays60GVb6SiTMv
         GOLy+3M4Fy+aweDA39xTOdMtN16Bxj4xRNHK6RYQP2W57I/Xd+VFA3rdLgo7xwXKBh+I
         QgZit652Qwa3CAV0/WqpZj231OPE6JhDZaQbAGEkzUPLPvax94AA2V/Pn7Xp8IuiU8Sm
         MMwg==
X-Forwarded-Encrypted: i=1; AJvYcCXWw/UYI5GaFY+LWACwjGfPnz3To3b3rw49EDGFiYpQJpvdP/3TgYXpYKbVJwV0v3XY1ckzzBDDiMEKHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDKMX6Qt5R/AsF43HvS24eKraYrOg1Nt8bcHMFQ/NgRcrASw8e
	1Gfn6whXbBq53uMHc0wYhJInhuaabSfWnCTWyak5WNmNiD7g0yooGZJG
X-Gm-Gg: AY/fxX5C8uUSFpPx+VkiMPhpJfOLLaKh0HvnNDiQpjhPyGS9t1asg4+3YGTD+Fq+I2N
	szAmUY9fuSVIpbsNBsRzJUP8ZQrVpGNmLNJk21SpFmA9rSAIqRWANJgRxtCrhoinKG3JIigZZmY
	rm00n3njTQadc6Vufg85Bn2oEYKfVKNlCh7E5sQoTYJtXOn6ODImzaxjZ2S4S9pyr4zjvYaFylx
	MdWanvYO80qcJt4LQfRRl+IRQQi2VGDOtuPuMbS84g/7KcBiptUnIFcUxoKtqfB+bJQjuL/tlKJ
	LXynyb6UyBrrGnARO6kgCN5Qe+HY5DIr/fmlGITbp5IwlOTTaqy+Dx2BT7/tPSwF0/9NWEdcZqo
	q0LKSE1w23aMK6djXn2lIBPr6ZTlPZkspHYCMcedIfYS1sksjaNuSzFzsUWAi4nevAnfh8jgCQy
	2KC+TmZe3gQ6mfM0J7/3g=
X-Google-Smtp-Source: AGHT+IH67SsAmDW+XdcDdNkuZHCuju5RGcFncESFWYkzYZSMHpAuj4JZCKO+lnsTd85qUcAxrMy/lg==
X-Received: by 2002:a17:903:1b6b:b0:2a3:c667:e0a0 with SMTP id d9443c01a7336-2a3ee47dee7mr204871275ad.29.1768241845516;
        Mon, 12 Jan 2026 10:17:25 -0800 (PST)
Received: from archlinux ([2405:201:1b:225c:eb9d:1fc0:f95c:bd90])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cb2debsm182203665ad.65.2026.01.12.10.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 10:17:25 -0800 (PST)
Date: Mon, 12 Jan 2026 23:47:15 +0530
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, linux@roeck-us.net, 
	platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] platform/x86: hp-wmi: add manual fan control for
 Victus S models
Message-ID: <aWU5Mf89hTifpewY@archlinux>
References: <20251225142310.204831-1-krishna.chomal108@gmail.com>
 <20251230145053.516196-1-krishna.chomal108@gmail.com>
 <20251230145053.516196-2-krishna.chomal108@gmail.com>
 <ce48f7b8-7d88-266f-ca8d-6af3b01815db@linux.intel.com>
 <aWUvvzDCtVCOaBwq@archlinux>
 <f6ca0445-431a-f9d7-eeee-0d437efa3c76@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f6ca0445-431a-f9d7-eeee-0d437efa3c76@linux.intel.com>

On Mon, Jan 12, 2026 at 08:08:29PM +0200, Ilpo Järvinen wrote:
>On Mon, 12 Jan 2026, Krishna Chomal wrote:
>
>> On Mon, Jan 12, 2026 at 05:13:05PM +0200, Ilpo Järvinen wrote:
>> > On Tue, 30 Dec 2025, Krishna Chomal wrote:
>> >
>> [snip]
>> > >  #include <linux/string.h>
>> > >  #include <linux/dmi.h>
>> > > +#include <linux/fixp-arith.h>
>> > > +#include <linux/limits.h>
>> > > +#include <linux/minmax.h>
>> > > +#include <linux/compiler_attributes.h>
>> > >
>> [snip]
>
>Hmm, these should be ordered alphabetically and if the existing one
>aren't, try your best (or add a patch to fix the order for all).
>

Ok, then I will add a separate patch to this series to fix the ordering
for all includes.

>> > > +
>> > > +struct victus_s_fan_table_header {
>> > > +	u8 unknown;
>> > > +	u8 num_entries;
>> > > +} __packed;
>> >
>> > Please add #include for __packed.
>> >
>>
>> __packed is defined in compiler_attributes.h, which is included in this
>> patch. Please let me know if there are any other headers that should be
>> included.
>
>Sorry, I don't know why I didn't notice it (too much reviewing in a row or
>too much multi-tasking I guess :-)).
>

No problem, I understand. Thanks for the quick feedback.
