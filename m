Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397D72EEE7E
	for <linux-hwmon@vger.kernel.org>; Tue, 18 Aug 2026 23:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787096030; cv=none; b=U2ukcqeta7wGvJyrEMoFBZqnDhO8mI5+Fenn559Ffa5s9qShXEs8ZPL7JDx3STZQj3lHgF7PrKGZYuy8wDU8QTYFjncQlS51f3EXOo6KAKYH/ErDuMataRKSeGJRS1Q7KRd9dfM8jEGw6ka+68zUy4WVEEyqXyBBJXoKpExC3Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787096030; c=relaxed/simple;
	bh=roxqCTEq/hPDgk4p2gdXrVVPTVJ17NcfFhZ8xPVXvhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sHkW4rzQoKdr5bs5Z47G1VqU28DUgf9aitNl8vAiyjKwJrOFmZCWie3Rt00SO2JZtECZi1u09vkFCmLekbc9JkjECjUy9FTmLAKKcTMYFgMI+4aCGHI2GCEfxGXMhybWdfqoNvBHQSeSIiv8MvJpGiZIAi9kWZ8h20/LHGJRsWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OF2cygpV; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OF2cygpV"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc11a30a259so327651a12.3
        for <linux-hwmon@vger.kernel.org>; Tue, 18 Aug 2026 16:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787096028; x=1787700828; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/xAnLP55G7btHdAtc8T6aDOwJEHunlOw2Qgw8CJjJCE=;
        b=OF2cygpV8Nmizikdn6wIPkx+CrvZptWSgxFQNmxVsr6zdzysUF88f997turcoNfPw6
         NNAIzJmGh9gYEOMBCQF1B3PwSjbzjBXD+jA5ZFOMAu/wyxUjJDhRFYV87KMJVejXjpi/
         qYs6wDD15Biw9F1ZCTotQ4Y7LmQp4MX0+LNvTeM883wDEZQLOJvw3ubUZwDpJmBMWhbd
         wnjlYGMM3ufX9YZrpcIdPeR0LuChzkiC/NC8fWpwMDxsUS6k4nHYQOe1leU3h+7i6Mts
         Ad/XyG70artUw8Rx88hcZu1ELpQv6kC6j14nm2ILiUCJzmW1iBlEFtaI7XvfBVeQwUUS
         +rgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787096028; x=1787700828;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/xAnLP55G7btHdAtc8T6aDOwJEHunlOw2Qgw8CJjJCE=;
        b=pRTzmeuh1Uqs8RoAByM6TBV6ILSu77SgFTGZMzBlS6l91om6KEHDvwozXPi9OIVZ8e
         5l5grwdo6X4clcStqyCrmL45P7dGkHiB5UuDyaBbxzXlWgQ/Wp+TgivoJPI4EBPB9nVv
         MzYVl7dAfgjZkm0SLbPB9YbopsdPMzepZQW4ik9Ll3sVJqjBwubTkAEl/QRekS5y6K86
         fTKl9fIXwvcJ0rCCLmRDFB0aCYka7e7hE+0dU+kkBk9yy61eLDkaJLrJNAyxZWzjdylV
         4aklrud8W0v0l1KghQRwpUF8+VfIEWeIcXNZ9s3X2RqGMAbrvvYNwA6TD0N46ZoaQLK0
         jBfA==
X-Gm-Message-State: AOJu0YwZhkC2hc+rw32SwCvyVmxfSRJjtBFPtjIVkqNEqicjgX6l/DVa
	qMQyalpGTl5uSoHzIIk2S5WmgDJu4JL1M4UlPZ8jtuGH6QxVTw8cEucYBsL+og==
X-Gm-Gg: AR+sD11zxQrYHjGnhH9whAiS8Bz2Jo3T5Ls1UH1YatBOoz5DvgqcMHoSfL5mToTwapD
	oBVdKLyRZAymwPWsjwlz8tevScDJGiqSadDgim2018BnrAzRqtXAteeTCfqlPMWXc6BBvQ8eWTk
	+HfbJPVBgYQ5L82iXv5O+AaE7abgztZT1zjtrUZ1x+ZksOTegSWRDeS0VCFv55W9Z7kVl9WF6gX
	AN+CV0xeSKmSCOY4e5ETgSQAOSvhodYk7Wm9V0XxCsEFOxeLcSwEryen4IF/vOEylKv2Iz8Yl2I
	VfGeYdbUuqxVssEsIvxHuOxBr5GY+hSq3CvvTWrrr8/CutDgGhhxfow1Q7LMvX/RMH57EcKzBka
	tPM907PwgordnjaG1glHRRPGVkj/Nf/GnaglOx2vHiHgMsycN22FgO1czssfvNQjfpT0EKbvTBN
	8kBSFgL6EhXfUynniAuFAQ0NMGFNwSL1u3FU4t4SwEcfihHtRrb0q4j9gtpdGB2O5KkfJc0TTKO
	w==
X-Received: by 2002:a05:6a20:6a20:b0:3c3:875d:c546 with SMTP id adf61e73a8af0-3cd0108943cmr1073515637.7.1787096028317;
        Tue, 18 Aug 2026 16:33:48 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef77be3sm566727eec.10.2026.08.18.16.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 16:33:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 18 Aug 2026 16:33:46 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-hwmon@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Flaviu Nistor <flaviu.nistor@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: tmp102: Document TMP110
Message-ID: <464814ad-b4dd-4afc-b680-9b59aeed22e0@roeck-us.net>
References: <20260812191021.65304-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812191021.65304-1-marex@nabladev.com>

On Wed, Aug 12, 2026 at 09:09:44PM +0200, Marek Vasut wrote:
> The TMP110 is register compatible with TMP102, document it using
> a fallback compatible.
> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Queued for 7.4.

Thanks,
Guenter
