Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9C817BA6
	for <linux-hwmon@vger.kernel.org>; Wed, 24 Sep 2025 14:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758725295; cv=none; b=YPcTBm7JPFxx8hQZM7n5uks51cf16+b+OiZwST2wqKPsTokr7NYQKHib1Po2ncf6CoQ/Ow9w6FWT9Eqho+edBbjxvGXi3GEqsjhDF2pmAvZZL9UC89idA2u4Mjdz5aWbRKVoz3A+Uw5MFV+HyypmPLInZLGbAikoHHWlBir+/DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758725295; c=relaxed/simple;
	bh=wNl7jQLwEHKQRZX0SAXvXgHbGWSN5OECo77b/O6rRR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CQFoAgWsUtqq42lAUtMb44F4xdgBSAeCXT7FR25/LwPnMLKI+MtakXyLdg+IokGauRbGvZ3tW9cahDqpZDZucReIRQuqzJg8kg95UOV1CRXzllaFsUPIn+NhHZpBgJH0I5LIRnGNoSpOAt08DEBqsSYjKOs0v4U8JkXEtdYiJZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bDVhHvc2; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bDVhHvc2"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-26983b5411aso49492715ad.1
        for <linux-hwmon@vger.kernel.org>; Wed, 24 Sep 2025 07:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758725293; x=1759330093; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gCnQwG7cHEZFPgTmiyysVJ/gsyay5bIs1U65I8G5nbc=;
        b=bDVhHvc29lIH9XBjR3fW55NSUCb7UL71qB5s0om3Crh2XyJpCyayXwPakpk591Yiua
         F1w55xvZKZwpPuHSzC5dLjodto558nD1BeQ433LholI0i3fHbVyUuTpXEIiXG4Zd/TTM
         2aV0Td29kMy0EAW8SUienJM+pCkamJcwiQZrSZmWRHomh1yGQYZ48+d0qLMsfJzi3cvj
         FDWM7yMj4frM/kJA1GXebNQ1/4SSMdSES9vut2wbORtJ7vKkadCKBicX9OTaHZrkPV0L
         Bpm6fwwOXJG02AH7wagRlIB7LcNPdiVZ8UNHtZlChWoEoC9TrUP0yHLp9yFAm4w5XqLe
         4BvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758725293; x=1759330093;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gCnQwG7cHEZFPgTmiyysVJ/gsyay5bIs1U65I8G5nbc=;
        b=L7GqGt2hcUXiftwETzK8d031k9ejPmQY47nJen9tYcJFMj38PgkigaVmbtVVkL3eg5
         E90fo3+c2xiAwtyk3NSd8nCpsGkVoODvEXSLclVWFFx0NhBJK+AyeLfr+0gYwyA+f9Kx
         N9R2BAGjK3fJ5LFpr+m7tS/aGdpJZ3KPvhML0JvqY53I1m3I+jR24iWsC51iT24fQUKf
         HG/eWf8SQzz7BO8YyyJraiy08w7tEvJE35VvfNf4T6nuKaTIDI1lJX4mEE0corJ0HsIq
         PGpZNff2aXTpl/6rQA3Is2FLpEfM+IaYUl+jTZ9EqL9mLb0u6ivmgApOHsCSePiPM/0I
         Astg==
X-Forwarded-Encrypted: i=1; AJvYcCUyceuVRM/EUbUftr51LCiwW4C9ujhRjr20vR9tS4Sm7+P2nD0PsuHuQA5BBdK5FqMg3a/GxvRQMzaKfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq0eiBSmPcFvlEQw960NfPY9JbSWF+Kv6/pEQTvLMqZB+L7koi
	RjfadqbIO5b5PnZi6ghP31VvdGZG85BJLyb6oU30vLI9HsveufSzNv4c
X-Gm-Gg: ASbGncv/fXaj6WaUiyqBcZB319wuG6x2fqF0yDtxGnn/ph2fRogzW1msNURZ89XLSMS
	v/DODsCE5qpKlfuVc7HcirA3piSfTVD+yTgem+9F/DRW89ObhX16F1SviPuy1Sad/1WGdLRs+oT
	ZcsT0rm1174eBNBkLf6K0j03rkh9vie3bw0Dv9kvY8uUKQdQeI+GxPd541RjxBhtxNzb3SHxfiY
	xiAsCCvJyoDPGRVKEsbATGZOaO0NSdD8Hu6ttRsOx/w4wsa6af28mmpaRVGG1//IzpXOdOS6DEP
	TigCfv26M7QF0oJthsTfV4c+KUSGkHkCJXag3hz9gDNuXfoFuLcupc6BQeS3nJ2eW1+364kCQXm
	RxYf8mQuFf0bh+tpcGqnGfWa+j+qC97y9zQ8RUfs8Ba/QrQ==
X-Google-Smtp-Source: AGHT+IF0Wc/aabCHtSWcbcm967HWZ+TJSB9RK+HGHmlKX6l01u9oA0TxcL2DvhecnXy93SqhEsB6PQ==
X-Received: by 2002:a17:903:4b46:b0:24c:bdf5:d74b with SMTP id d9443c01a7336-27cc27c217dmr79382925ad.19.1758725292956;
        Wed, 24 Sep 2025 07:48:12 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2752328629fsm105445555ad.106.2025.09.24.07.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 07:48:12 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 24 Sep 2025 07:48:11 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Ben Copeland <ben.copeland@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] hwmon: (asus-ec-sensors) add ROG STRIX X870E-E
 GAMING WIFI
Message-ID: <e2dac203-2edb-42b3-b75e-f9b119922250@roeck-us.net>
References: <20250923192935.11339-1-eugene.shalygin@gmail.com>
 <20250923192935.11339-2-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923192935.11339-2-eugene.shalygin@gmail.com>

On Tue, Sep 23, 2025 at 09:26:55PM +0200, Eugene Shalygin wrote:
> From: Ben Copeland <ben.copeland@linaro.org>
> 
> Add support for ROG STRIX X870E-E GAMING WIFI
> 
> This board uses the same sensor configuration as the
> ProArt X870E-CREATOR WIFI motherboard.
> 
> Signed-off-by: Ben Copeland <ben.copeland@linaro.org>
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Applied.

Guenter
