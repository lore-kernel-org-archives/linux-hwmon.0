Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B3939F17F
	for <linux-hwmon@vger.kernel.org>; Wed,  2 Sep 2026 21:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788385112; cv=none; b=BWmMhOh41odOM1IzIQVdwf0/HsiwvZLX7nKNGhDcz6GgFbZCoAukBI5k9JDm5kJ2ZNGZZW8+F7aahShO/Dz0Dit8r8l7AP+GKEZeAyM7Rgc/xk61k+Nqx9r7gEFdBZpYUD4eM5yR7Gyv8vIQICq1m4KiO9x+bA+cLJMpEEceLVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788385112; c=relaxed/simple;
	bh=db4v1ANHItotB3g1ahWtztT7Yb7zlAgWKJovQuc6WCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MaJAb6bWTv43cGPmDu0XNvjohez5EUEJ0GZcFdN7Z6j6ZwqrIT1MKbyY3XX7cHXhvkZrhZcjUKYokYCVrAD94FT1q/b/Q1ExRrR02KiXmPYVRHmy3DYlKYbJKZYD5ZKjmPhe2bhFE6H3Rpmj0adMvC3jg1TEy3vHe1FnwWfxBcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UjyxnMgg; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UjyxnMgg"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3964e480f76so2180883a91.1
        for <linux-hwmon@vger.kernel.org>; Wed, 02 Sep 2026 14:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788385098; x=1788989898; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=30sqDP41t03ZcDIYxCSfxup+Ho20GhNPDK6CF26Jmn0=;
        b=UjyxnMggSvWjQlQ6CH5nhRqcYjt8lUYVhHTws3E11wjdUGatGChOCAE47U7chPtM4x
         H3OuRn0VIfU//l/Pv7Xeo9kDZVmgh46OC+6qH60Kkog8mrr7NjorwO8xJel8gKz9MHet
         pKoH4yX6nBxKnDC/mQU4FBWIVoZx6gRJvVp1NrzRvfh61WU0Ym+JU9/jxk4vbI2Vyq9N
         vRONhN76vDDHfiVqyuTzxSf3GXr0AI72hno2RwDpCSJqtPuqTZ/NfuW1iJLYk6cFOfeb
         JRfk5n4PUFzBd0Kg/rAR+84Yb0s6wM5xpe8k/G1kdOJGiU9ObcCNcy2aB55xkJYIYpd8
         trhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788385098; x=1788989898;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=30sqDP41t03ZcDIYxCSfxup+Ho20GhNPDK6CF26Jmn0=;
        b=KPldsxfzukd0GcUHo4kV5ip8zVXrD/1nxBtqDLGWJEslaC0MuhmEmiqVWbnTx6rW3A
         D3eqrVLo6MAs4YfcwF5GUa2GZ44ilysy1eR2cB0WGFT558xQYWb12g+oybpPfLuFAN6o
         9c5hvq7Wg7/5VcIvYlL5FQr4fenVUys6Yt1y4LTLv4moYlQvKJxe7tHQDiLFpMwZ4RK+
         jPYxWvg9vL8kvNS35OmCyxJxogfTSCW2VH/KkTi2/czFP8z+2SijIiKiRuaLWKhoj25M
         vkkSWGSmcuJuYTv5tgDsi5RWmnz46/4wkuFzouViumylrjwKem4tekI9BUGuZQMrFQlp
         SBFg==
X-Forwarded-Encrypted: i=1; AKwUvBxYcgwZ9uIqLs6Akwn7ygMg15Fdu3s51+lIUIUlXtM1FSvd3VBW2dSjsCkAhyiCMJ5yczAZHQYEZzQHlw==@vger.kernel.org
X-Gm-Message-State: AFuF++kwsnM5K5atDKcJmcQeNU3Cdpj1Wp2yEi90jPziQyOI/55DAAaJ
	pzS+7gDm3w8Ln7CuI09P88WcgRCPUBCS6TOivtf4WGCFg6WfLMr+n7AC
X-Gm-Gg: AYBFou1wiyXQ1M799NUDbDk5qfm4GQa0DERJOzoRMLxjSG2CbPmR9nCd3AmtvMkEbEd
	3r0KXbjMX3AwPH4bCea/DH6NjASAtvpGdZrRRH9d1pWyCYYDb/6fOGudo9UN9QXwLMU61sncDvz
	9gV6Su7/zcwodiy71fAS6nhNP1k9Xm9nZdt/bZdjuevgD03m7U+Ba+HPkoef+ABb9ShjiUvzcEc
	lJaUpZKwGY/9y+jnW9K7I1sdHSEbhk8qPuwHIl0/LQiVVYzXCSAdUEMyLeHj2yJ62zzDVBRd+Lp
	n7V3HIFoWU0XGLlwg1QwJ31GL5TY564O/l9MJE4ao1bHCZar1dqnHUZpa7WkopS4dGje/ec9t9N
	2QXyZzNsFIsvT0j7/Bn2TP7w0aT1TsNShjazKovoRMt6zZACeqMhw75XtfFTRgZB1lTFGd8XMh8
	xfXWnJjAv35oBpmB0fEe+nFmdeET4jXrWd4enAC5XMBY5Uw5cdJ/1jL5qUDl825w2E067fCAayR
	g==
X-Received: by 2002:a17:90b:2b45:b0:38e:4f41:83df with SMTP id 98e67ed59e1d1-39aee16515bmr11966313a91.15.1788385097798;
        Wed, 02 Sep 2026 14:38:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b083e6e3asm1371740a91.2.2026.09.02.14.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 14:38:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 2 Sep 2026 14:38:16 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sanman Pradhan <psanman@juniper.net>
Subject: Re: [PATCH 1/2] dt-bindings: trivial-devices: Add TI TPS53622 and
 TPS53659
Message-ID: <870df75d-bd0e-4e59-a81f-880dc4207dfb@roeck-us.net>
References: <20260901211129.360792-1-sanman.pradhan@hpe.com>
 <20260901211129.360792-2-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901211129.360792-2-sanman.pradhan@hpe.com>

On Tue, Sep 01, 2026 at 09:11:48PM +0000, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> TPS53622 and TPS53659 are PMBus-compliant D-CAP+ multiphase step-down
> controllers. Add their compatible strings.
> 
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter
