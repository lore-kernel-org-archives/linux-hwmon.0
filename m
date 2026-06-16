Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F334508F2
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Jun 2026 16:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781625931; cv=none; b=YvNegnapmhjebGC/pz5IG36js/RIcO/FTvLUDYd1/c3jOfeVASCyuFTvEq/ILE159QjcHMeaLmKIMjrNx6gwT+gfkdwsWTHsC0CrSVvp1fNMd0eKk5UXQbw2DV7It+fSKynWgv7EyqOTTQodcCZ00sg1Esfw/W6ZrdcHZabJMiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781625931; c=relaxed/simple;
	bh=5BmfNz31elL33W+DFqbZwIg2spmNt9o818h6vIAVZKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=luRTpJQzr9FLm6i1yk5vRY1AVant/kLIhbGS5L2tALAjmmFzmvjBdTOfBHWFWqDZkjRxGEAeEL5CQLpcQSxzFJE6hiSCAZxk3A+h1dSvehcXhNYbKLcCfNiQg/1R1z1lW5t13c8MNHSZkiSjxNURkl5KDpRKrZ8m9P5aOeC+qvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GCa92KX9; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GCa92KX9"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8423f626a65so2339200b3a.2
        for <linux-hwmon@vger.kernel.org>; Tue, 16 Jun 2026 09:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781625929; x=1782230729; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ut8DH62cXwFUGIFCmNmiDVzf/3BRt6aDfnSwnTkGX00=;
        b=GCa92KX9dgx+KMFa5WLUTiq8Me6dfhZ9kDbmVlOCt7FgxYS9IYxg6qPgxyHtSyuhQo
         zTbodRO/puG1F9LeHgNV04k2FbDO4qxzjIsQdkq678d/QrlipLQv0hj3aqIjC8BeUaLr
         pMCW9LtxL+3n23Gps9zNR3KnVOmjzetTaC6wxriDwZplVhYLviM1g0wszfyzxLEPCUaX
         ci6j34ZDpH8aXKcIlCDfNNIE9HlrEJvlVS41aipdgWa5atsWhASD50f9Qv0/Tx6Hqqn8
         NjLIaG8wnJ48pfVyx5goJS0pktV5rODbCKUZYZM/WfSR77hbQHhVQJC6svi7+8ZX/Sr+
         JJ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781625929; x=1782230729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ut8DH62cXwFUGIFCmNmiDVzf/3BRt6aDfnSwnTkGX00=;
        b=FG530zKibhSXySCIFJmpQlCCpp4Mxl2f60+qUThchsvNi1CzS5Mf2jDfPf7kFlTYr1
         DXHII9sjud5t31yP0/sc5ebpUdqVMQr/qLcJ/DR2R+8hW/ZYtb29epE+Nq8UNIzm4u83
         WEcqDjz28NFoKTTK/yCdXExi8/TBBIRF7HPPXdmnFScEobNulOOBZNmdsJEwin1PTUst
         sbMII531tiNv1mmICKdaFhg0/hEFrvrgB7Jr0Qg3DlgjcyjRhc9VC3m8om2eCRE/dTZK
         LWQnqYpm/yFdSlkjAoqQiKZIho6HuxjytosxVRLNop7usp5UJ/sIyJL9iM70qqSVpyge
         ogJA==
X-Forwarded-Encrypted: i=1; AFNElJ+B/gkW4o0hBd1lDq4GiRKwaG3YiigM8PCep9fhAl13b+q3+UdG8cMEG9S3Ga9CxuxV2iCqO8T75MTM+w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9NfK267T2qGhFKNvuSRwysekgwzqMLfoSOHxFzaGtCGW1W0Ct
	2FRTaqWQJoBZg042DH7/BRwf1fH4epw7ptZj25oUVTqvk6vhpIbv/4QW
X-Gm-Gg: Acq92OFuhsMPYQ17tbuQWlxsU5FNdFzjF8BkBP30uT0SfQfKwIwxb/4ncx2PEJIHaF6
	tRakRrKjZvb4T8X1K05s425EbISZXSW4j8wK12bs2HPVDeeX5HXAt63m3FBGVh7CRvFZjqhz75J
	Vnh61KXhEFcEoJUWvtnzZ7oonmkeknH1kfIEB7E7QIzI5sApUrOC3NFHUiq0iBlwBQGW9sU9S3/
	hxNAcuToATVK5KTaHEaFFI4kswaeDeM0etDSybfoxRh74fVFTJhYBpRvppBNHG9t+a+p8z6FF0p
	8Mv0KnXyfTQtSW6ZFQGkPoUbk/n9PulIOjAgv6z5Yln8sDJWKZq4mM2E/T7QI4YOksn+hMdw3Au
	yFIDn6uhMZ61ppRI9ugcSOgKUzx+Nx0iqhZftjJs3fzy5LTXwnNG8YevSrHfz3QIKfdw3OnigxF
	C7A1vvqKq1Jio+KJ2xr58zSfvq0M/D0Yz10Fsu
X-Received: by 2002:a05:6a00:c83:b0:842:6004:3fd5 with SMTP id d2e1a72fcca58-845154f58d3mr4332436b3a.25.1781625929241;
        Tue, 16 Jun 2026 09:05:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b03fd0bsm13513779b3a.50.2026.06.16.09.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 09:05:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 16 Jun 2026 09:05:28 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ziming Zhu <zmzhu0630@163.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Ziming Zhu <ziming.zhu@silergycorp.com>
Subject: Re: [PATCH v4 3/3] hwmon: Add documentation for SQ24860
Message-ID: <c011e1b9-3496-4be0-9f82-65c918b776fb@roeck-us.net>
References: <20260612030304.5165-1-zmzhu0630@163.com>
 <20260612030304.5165-4-zmzhu0630@163.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612030304.5165-4-zmzhu0630@163.com>

On Fri, Jun 12, 2026 at 11:03:04AM +0800, Ziming Zhu wrote:
> From: Ziming Zhu <ziming.zhu@silergycorp.com>
> 
> Document the supported sysfs attributes for the Silergy SQ24860 PMBus
> hwmon driver.
> 
> Signed-off-by: Ziming Zhu <ziming.zhu@silergycorp.com>

Applied to hwmon-next.

Thanks,
Guenter
