Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417F5278E67
	for <linux-hwmon@vger.kernel.org>; Thu,  2 Oct 2025 20:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759438349; cv=none; b=p9NEaruMRO2M6VNUwQQVRS1+YmsQHVAWdQQAFZn1P9t8+SU3HIPyAASUURofEkjUjSkGLvuHiwk9ofip/qUmtOUzkQudwGOQykn9c91+aC0oDW9uXZEjaPuijTiouCBMjeFNMxd8Lgl8fIrh7LuJNJ/MyNYALo5D1MATgielcNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759438349; c=relaxed/simple;
	bh=DvKZeJuc8q1pMCcveAAdBLsuoO3iYHiqN7Yxh8CK/bc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KXi9S5P7KIM4eblJIZJFbnWkDIPENzWLuVnQulok74/Hao4XT7YzlN8Ie12Uu0KLfM6FgC/Jz9gbfiK0EO8EdIDr4dkSnQYzBoh60J1hHQtUDRR+khusMqO7ABQaJC2NJtCLZtjL8CqEUxmm9eajThzacRUTDn+jDMxvOxIaj6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VjnxI9Fs; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VjnxI9Fs"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-33082aed31dso1747270a91.3
        for <linux-hwmon@vger.kernel.org>; Thu, 02 Oct 2025 13:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759438347; x=1760043147; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wt8+KJKLTvjnTsuEvXC7oAoHF1RulS1QZOqpF4RenyQ=;
        b=VjnxI9FsS0LtdoezIfJ650dPiD8s7Qdm80G57wvuC7AZs0vPjHFRa69WFn+P0AWUcT
         HT0Wfq44xLZD3jUpHHr3kREbXlx09js7vVtFUgil0tPOcxv0JFYT4tgXC2O4jjPMoLf+
         VeKO+Htwevi6g/ZNPNrEwfh/YiLOKzGYaXSKqJRx5Hhd1lcbDbyWzElr6JiC+biTOIrw
         6bVn/8terpx3pJFrCNKPNdIJgV1edcmgbnFFrgJyKo+vYUaXEa6c7dk886HXuNX3ev6t
         +lw9dxTFiC48EWxg4QgpIOijgVNFzfxTmb7AZbjiGRX4ttXiNod1PI/M0PJWCDLpR3W1
         fxog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759438347; x=1760043147;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wt8+KJKLTvjnTsuEvXC7oAoHF1RulS1QZOqpF4RenyQ=;
        b=Xz7CoNHCPTypmsi8vRmXT3qohkDn/nDHh8SAfp1n8RirhwbNFjJKkiDlR4DpUNSQvN
         D0vyhR6OtIcAPkGopiTmNMJUdEr3K2VjS6evQtJoSNl+wdBqFBOfxEQ0b/hPZqgqmEwy
         Yo/sa197McE2b3BcV6+GXABgoNcC9AgBFrmbLwgjluBP472ZrrVaxOnqd28p2I156DGa
         nxTZSFxcUk20xrajqP7/0hJHaOrC3UAa4E0GkVC7Axzp2bEXx77f7QKQSSNAOX5qEAuu
         jtezfiGXOOT5gwP8ImgYDxQ2RpJfuKRwBR8BE+IRgfj28QTDWXbj9lQ/PKBoDlnNKVyk
         /1kA==
X-Forwarded-Encrypted: i=1; AJvYcCXNM6UogGKhEQe0BMDuNjpTpsoUdEWhlq16hAgr3GU+oDx3P7UoUAVMQfjtWLaDLNY+bEX5QKzRK06kKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGuY1h1YIWDoFU8kKMi4z3JALgzAtus8nT0tqd7zAgkm5HFQLW
	3deh/sk2JUgKMKirbKslYt5gdJ6F+7cWTH9VgaotrIo8KizlpgkBKGwp
X-Gm-Gg: ASbGncuqRJXBvn9YAoAsxnJvbxJwE6sHe3UC6lfeCGpzGU5n+ww5zLl4IQqHnkmwLVN
	l+yT3ynqedZpqv86+5vqkkXnQK+OpU6V1WM9OTjbgSLa6WvdvZzB9KvOmHHnFCM04LoYeKxrEYm
	o+UTiWVrpovSV3FlGC6qPfGYX4ytKknqudeyVi5EYQ70utvyRAoOiy2xh66R7HdaO0UeF4NZhUj
	hgWo+u7cZ+MHCQ9BBBfwgSsMAClclKyyt+BI0ZeXI6WKUDiD/PVomf/V/ZDLKIyH6DqMxufPEMU
	TEEdUyds51kFvlA35r5LWuVY50yx7y3/2Xdx078YtwyOaoxcrjDTYAtI+tODlkunyRaYLe+V1kv
	d/SB+e+PitOlZiWq7EhtcF2kg2X1je5jnGp5XkSdfBmpcIu5nC48Moo40ew6RfdqKAuPbXQ==
X-Google-Smtp-Source: AGHT+IGUkkG0M/4u6akYKC5LQ5MwjiuQ21TfsswJrB9jKVK8JMKVo01HtMK12v0tDjHeG8d4+1MNuQ==
X-Received: by 2002:a17:90b:4d0e:b0:334:e020:2f16 with SMTP id 98e67ed59e1d1-339c2720714mr717648a91.11.1759438347329;
        Thu, 02 Oct 2025 13:52:27 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a701bf31sm5792124a91.19.2025.10.02.13.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 13:52:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 2 Oct 2025 13:52:25 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: wenswang@yeah.net
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jdelvare@suse.com, corbet@lwn.net, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: Add MPS mp2925 and mp2929
Message-ID: <7c751da9-e480-4c20-85e8-5ceaaefa1027@roeck-us.net>
References: <20250928092655.1394429-1-wenswang@yeah.net>
 <20250928092845.1394718-1-wenswang@yeah.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250928092845.1394718-1-wenswang@yeah.net>

On Sun, Sep 28, 2025 at 05:28:44PM +0800, wenswang@yeah.net wrote:
> From: Wensheng Wang <wenswang@yeah.net>
> 
> Add support for MPS mp2925 and mp2929 controller.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Wensheng Wang <wenswang@yeah.net>

Applied to hwmon-next.

Thanks,
Guenter
