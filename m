Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B04530569A
	for <linux-hwmon@vger.kernel.org>; Sun, 19 Jul 2026 14:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784469988; cv=none; b=Bp8yem332jFXTNAK0GtpWKQP4MnHARm2NSr9NNzmKFGc847F7S6pJo/J/ay2KCu+FHzk5hge77te+/oaWVTLzz5x7Lo+Fo40G5kZyrKcDNz4M2hdHiauAmzHU6thQ1D0RZmt6PymgEs9e54Almx6IGyPuCaLFvQ17jCnTu+eXDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784469988; c=relaxed/simple;
	bh=tBxl358zMsXKLv7H4hC2rLLqhGkmvSxkoHKch3Scrp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AC9XNCQ1C3r+GfsdiaDS4mfcKfwZ2yF59WNg5xsbTPwuBZ/pg0d7IAmxh4Al1k2Lp5KZIM4FV+gg4uh1joIJVwu13U2d9cQa8H4hydfW1LLd6WTBGAj8VsFeTh7xjG56NgIk65HI4lxvdeW6h36wtpQhAzuMhy7CEJR/4b0e0xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YeXe/WaO; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YeXe/WaO"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38101f85591so2385127a91.1
        for <linux-hwmon@vger.kernel.org>; Sun, 19 Jul 2026 07:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784469987; x=1785074787; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=X7+RSJ2zBvLkg7eE2oEuVngZetNyS5kmisVv2Dyb88s=;
        b=YeXe/WaOA6RZgufIrMbf4XLGSEb5lyxcrqo61hSmjyff++DJwAQKb/CloARVcOU6/D
         hjHSSdKoRNoiDBgoSr2+MTC5cdb042EUsnoJU/O/7UVKzHPm8fI9UKxbCglm/olWlXVX
         DnVdm1oNir+49vtbsKpuoDgJvXBkrn0WK1WDmpB5GgCt0ZfnRehQqEAV0QsaIYOm3I/+
         v3oS0IUfoaiwvqkDEVdBLDNFIqjqxT9NOYXSarB29psr1RsmEegW8ioUd84a16zqilQY
         Z8zcih5gyqz6QgrfjR6lVJKsWZZRRNikUHc14orytpmsUuzE7YM2CyZ8YusqSab0VWFl
         P+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784469987; x=1785074787;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X7+RSJ2zBvLkg7eE2oEuVngZetNyS5kmisVv2Dyb88s=;
        b=QaKbfjuelt1nE28hLQkqJcvsvlBdfF7U8F2sX8OkLx0UZNjt9mfPXidc9XpU4jORRG
         nSQzFko3pBM9RgLXioqvYUrSIFm6xlVSu4DDqbLW9QwQA6z9xgwScbd3YjNhMl7zW2NL
         xqfG8aNtFR/lafw6+RjYDRyMp9L1Uq1Bm7DBsyDt2BBE5/lBg+F5V4UTxNN9/4ewJZyn
         byQ7RTCVKhHYsl8xaYMH98seAJ+JTEqKGL+xV+dyG9Eca80jiOe6Ou6EbuhEz87l3cNk
         kfXkP9HL6P81VNgEdx/VRoAok/EcSNjXvIdt8nzu9N/X5vfDeYkiR1Cd9Cq1VEDLjN1L
         Nt1Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro3+jliguW9okBAhjpDrC8RKx++Wr1cUTTgO+AccPRodwjICUIneJEwZ23Bf0ZbHMGCFc9ZW5cPyKiFUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHPaooBXHKx3VdiMPdWR669b6uUSUSIbM8K07JW/eqqXwjpicv
	jVoILjXUsqb8IO/WlAC8REDKM1pj+jrVPTWd2c9l4SdyCnDFEOuZ5utb
X-Gm-Gg: AfdE7cn388ZEaBoi0FRSAuJTJiuWLBDY/k8CuHjPLHHQi8v1LQ75DQTrZv4Qht1ON9y
	2HUpMOzgZx+TRdc7IbUjYSPxlgjLcLrNoJRkDU0a7XnuNsnDTiNbnBkKq03fHtFb62O8fP7PvcD
	ZyzJb0Lr1sZ/Tw3cJGxZhwBe5M3ICFbJgZmk/qzPziQv7FKTMZhSPZkeW1RuhJMFjl/8kkogrmn
	SQ4DR6RsvclymtyAYn/Yze9yauvrmppMUaKYKXQbzmhIBfz1nM1BBmVPqZHjKvDHI91Ge0lzLk9
	rv8WsIFg16r2FRU66F1qhSpvjSGoHsefAFEbjBYdQyyvJGuA1kSK9lRWo91492+SOOytJaRZIKU
	Uikcdo5qhcURt8wHHP1hxGlfZWdJwL4zSwhGvmp+Fp/kh5hCEV8h29kKVALGZzJWFhCNt70tfRe
	TuUEVHUSI9d2VrP/vhOv4uVSPBVQ==
X-Received: by 2002:a17:90b:2fcc:b0:37f:d265:18d2 with SMTP id 98e67ed59e1d1-38e4b5389ddmr9568508a91.7.1784469986701;
        Sun, 19 Jul 2026 07:06:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e39de7790sm6140653a91.3.2026.07.19.07.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 07:06:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 19 Jul 2026 07:06:25 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Flaviu Nistor <flaviu.nistor@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (lm90) Switch channel parsing to fwnode APIs
Message-ID: <edb03ab2-1211-4bdd-b4f1-21f80065ef6a@roeck-us.net>
References: <20260717063730.5617-1-flaviu.nistor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717063730.5617-1-flaviu.nistor@gmail.com>

On Fri, Jul 17, 2026 at 09:37:30AM +0300, Flaviu Nistor wrote:
> Replace OF property handling with fwnode in the probe function to read
> the channels properties, improving the driver compatibility since this
> method is not limited to Device Tree only.
> Add also the needed headers for explicit include and clean up related
> function naming.
> 
> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
> ---
> Changes in v2:
> - Remove <linux/mod_devicetable.h> as suggested by Uwe Kleine-Konig. 
> - Link to v1: https://lore.kernel.org/all/20260713190659.4511-1-flaviu.nistor@gmail.com/
> 
>  drivers/hwmon/lm90.c | 47 +++++++++++++++++++++-----------------------
>  1 file changed, 22 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
>  
...

> -	err = of_property_read_s32(child, "temperature-offset-millicelsius", &val);
> +	err = fwnode_property_read_u32(child, "temperature-offset-millicelsius", &val);

I understand you consider it to be irrelevant, but temperature offsets can
be negative. Please explain how this is handled.

Thanks,
Guenter
