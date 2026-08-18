Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE1C2EEE7E
	for <linux-hwmon@vger.kernel.org>; Tue, 18 Aug 2026 23:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787096356; cv=none; b=u2YKccuUZFi/EUcrUxMqFDLmFVma3hDdPWj17gjSLmIpPyUAtTgDJz1K2TQ1fLuGCa5xsQ5MAqJPGemCCzDcxGYzhApu4EQnVgSC4FtarZBH6YUhG1ptGDEIOQKDwvrbxxqy3sTtOC7p1DvAzaHjh5UW/Y0KgSbTmOHEzUnDKCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787096356; c=relaxed/simple;
	bh=IlNVBIx4H6PkgD7zXgoekELCW5mFwid6ryMfcRReOq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j+pEZx64ZxxgSPz+vO1lS2VpDtI9hkPnb+Cfpemlb1Hl0i/mXPWRGi+pqyhw663n4yaGZG0UPaeu+DEez3BWhuzA556neXzmfFPfjSdhvqANkoUIjlWEWFuPAsMQk145s6+5DTA3rfjUaiJ1Uh4LODr8TelhnQACCJspQNAkv0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aXZgnG2o; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aXZgnG2o"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cbedd5aece4so1174998a12.0
        for <linux-hwmon@vger.kernel.org>; Tue, 18 Aug 2026 16:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787096355; x=1787701155; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aXe+DqGRO+U+o5USvhMVUyhu9ixk5r/8S43UJAXzTP4=;
        b=aXZgnG2oQoemKz9kr0peXnlUtIm4Q+VKAvh9z5/e+HvtjA6DmAH2BUfk/T2UUrl02B
         9v3s7VAeG43Jy1A4UDN2OpCr4tIa8t4U6vk3Obn6sH54SyZJyMDYlt35puR8pmT/0K8s
         5xrX0CpeIykOAFv36xu48kMFXkJeFah/qnf0ZzNFzpBTY5FR5BqVHrty25POZnQELt79
         PDP+Zm1dIfmuHt/hX2TW5oa1Ro2fgBdxaahVcvgvmQlmD/4A0PnxRHjLj6uMkSoiENaj
         mM/BqGEekdcG4yXjdxoce8n3ykQCNAnJnBF3MYDFVDq4ov2LRPlTEc4GY0pEX0hqnfY6
         IeUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787096355; x=1787701155;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aXe+DqGRO+U+o5USvhMVUyhu9ixk5r/8S43UJAXzTP4=;
        b=Ea7VH27tqoJoHiivqDfG+b7WAyU/VwiO+y4U7JRfy7raBBCJJ7uXVSmiGoTZaI99y3
         U1TFY1SRWx7oDLSeqTWpjXiqGdGHPl3Zy3AE+Ls69JXsED6P1S4x5aJ7CIL+AJcirAK9
         3JnIfVyggXhvPjZGA+GtObE7PzUPcnp5sGmU2wDbKyQhbBywPZVgyhAKuxW7zyYpdfmT
         YEstIOmGC8jYKnBphEX6+GniK8WkQflYCPpiuECKFcS7DLno3AxvYUxiYUE4BqOWT/4M
         yE16DtSSS7U/jtIxPSYH/g05UInfCijmGv+Z8+3wKzy32yu+2uj5rJDfN+pWks0pfFKP
         q0zw==
X-Forwarded-Encrypted: i=1; AHgh+RpRQnEPBQ3oGA0OFx027z1m3ywRkci4wB+5BRw4lBNMklNT1WRi1TgtVmW8+2OHPe/CTnfvCkNKzzw96Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVS/w1m9P+WN3dgQ7LNMT9O1MNsFUDbPel/INLdvJnpJ68Zgoo
	WsfFD5DUXeUTEM6XKsdXAEpKcThsvXYwuI0jQeWrXe3eLUJ3DO9D0X4r
X-Gm-Gg: AR+sD13NkhBrdtDzRuzS/5bSR/AYSG2H9pKJ5abellDsNTXaXdeXGtTrpZrotDZU12H
	GiOgPxvrQb1IAmP5D+E/oqv/yVuriK32zWI1buuaPBbrig4DiX9YEPCsNknMtW5YDFCpnULLu9O
	XPh05c9DTwZZ71YG/vXbUlpzYL9UYeyI6Am1M7YGV55rRO8CNgGoAvtYOHlr4gj3r8mvizCtmi1
	LPaDP5Ui5OjX439m/EjGMgqfpozFw8iBSYDG0mKIV2E78bhNN/c98gj7wO8fg309bqjd4ieJdoC
	kI1bGkGfMunjkzcxqrfaaapeCyx3iP+QlrAQSRd6MFx5A38aUC7ObMGIAYh/AHO1Y6GC4U3Ip6Z
	5mJ8FErmVX3AU8wUXwtqkZFQfQL6dkysdEoSj5m9I7NleT7e839T5rIjazRUFTHRwEuRHZeE/+M
	tKMM8/dHgDSUC4eOv7uOYuLw+qRCY1poG8hzjnFDwIlvuRJXLqDIs2jQhqYTCYSV5DtNY2HWb83
	6BllmHEAN3ULA==
X-Received: by 2002:a17:90b:37d0:b0:36b:de66:92c3 with SMTP id 98e67ed59e1d1-3957f989f59mr1093695a91.10.1787096355080;
        Tue, 18 Aug 2026 16:39:15 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf10ca5csm552871eec.17.2026.08.18.16.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 16:39:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 18 Aug 2026 16:39:13 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: Cryolitia PukNgae <cryolitia@uniontech.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Documentation: hwmon: replace full-width colon by a
 standard ASCII colon
Message-ID: <075ee43e-633f-4bd0-b752-58f2fc7ab862@roeck-us.net>
References: <20260818-doc-hwmon-remove-confusable-v2-1-c1dff1ec01cd@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260818-doc-hwmon-remove-confusable-v2-1-c1dff1ec01cd@bootlin.com>

On Tue, Aug 18, 2026 at 10:08:40AM +0200, Antonin Godard wrote:
> It prevented the pdfdocs target to complete, prompting the following
> error:
> 
>   Latexmk: ====Problematic refs and citations with line #s in .tex file:
>   Missing character: There is no ： (U+FF1A) in font DejaVu Serif/OT:script=latn;l
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

Queued for 7.4.

Thanks,
Guenter
