Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3993528EB;
	Wed, 29 Jan 2025 16:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738166783; cv=none; b=UnpyhOOITonf0WOGyf3kQ3eXcbGMyCW93ap82BXz+9WmgGmRZ2HgsZ77kPrSwQaQMyj471uDVd/8oo3Mc/6UkHLtGdSTM+D6H0kgypQB4+lNMOjcTU8mpgGMM+lotks88jdwzyrCKh0wOIdPOPycr1HgdxXKOC56koZZ2RrI5wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738166783; c=relaxed/simple;
	bh=ZHLUAT2v7j2pRuDobM8HINfswbd2QymCnowO65eIPtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ttQdXQBoFw7cRa9VBk3aizcxloidVe787IkdzT8wGYhOPr/WetI69SlM4iJSLrFyCsipfVi52i4rnuz03eET/5yEDO4ypzS6x3u+2DduoXzJCB8RtrMau3t/PJe1NUQor+j+NUf2O0Apf9ByNFrRqnHkYWc65d7zCWCHRGrb2wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jY+WpXQr; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jY+WpXQr"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21670dce0a7so8900825ad.1;
        Wed, 29 Jan 2025 08:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738166781; x=1738771581; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=es/fEvJnp0/Pf9syJUavjkqWycqhCq9LXsLp5cHj3fs=;
        b=jY+WpXQr41rkamZCo6GEOnrR4gzgGgIRFWcBhMKRtiE64IIQFL4LT6jfTud7AvF/8J
         SjZ0HvJtZLEXmKKwVPyI4+GfCztJS95qzBCyU+s5NZQhJE+gNXIv25R2HzoL1SBIUHch
         /isbRq3pb24SnVPgUz00FlC9bEfTEZYlkQ7hs6Y9bitluqSiF71ysu1OJhjX3YcQ6v/q
         yyS5SfxuwAeHJ7zvrAxK7TwCSyOGhYTL4+b5QPuhnWcrxl6+rBz03LcQdMmqfL9+Zpuz
         xWsC7TsOfn+H9FDMRvu3lfdwMuMBPcv8SvAzT4YvmYNhJl3q7nf1YzSb4KGbQwElrCk9
         6vJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738166781; x=1738771581;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=es/fEvJnp0/Pf9syJUavjkqWycqhCq9LXsLp5cHj3fs=;
        b=YmEJSw1qLg2OSQQZ2vca2akbGHkeCkhW3Bijo5j6RYhlAc0Rf+ZbxNCEm5zQu2Nclx
         1EZlSnFmQX0xemIsfifhP2u0DhVm1/yzQgtOW1GgoIN5pXlmg/jyrlSyj2GudR05/Wja
         9u5Faj7LU6exef6fNH8D/bXaI3j8e+Rilrdu1r3LJYnLaJ1ImcnHAtBmpwBVtUeMeiw6
         AzGk35/nRHbnJ+l6j6VktOzgJfmXAW9AEipwJoGoqJqQMJ/99bPyGJo1k5bSuFBeYEoF
         lsdvzYsyd7vvHPLq5P3N7LMdEbn81SWVoXuwvzcO2GX4dDW32nVCH6NAFfrFJK+BD0R5
         oPjA==
X-Forwarded-Encrypted: i=1; AJvYcCU1u9t2/GrzAQdhv3h2JiCDFNSjyMSbClyIY5boUWBtVE5HcC03gro1drhaCvK/bZYYuivIi6ndj50jEA==@vger.kernel.org, AJvYcCW58BdHsmrGFvuP0bn3R2BSpTOrjjEz3gz/I284v2oukyL/pnRZHKSsJ8RPEvA9CiX5mpJjKBw5KHNQCnqB@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd7lqgThYjMJu3WCmiGJBAGziINYFoQhd1u+NPk/QO5084JWhP
	TyWl6XNyqhpLJA/DYGuXCqo1pRiK/UlBfvS4DE1Ougm46OZ8aQK7
X-Gm-Gg: ASbGncugDXJGNQZUTMXO1PTOGU8ROgT44flWEXi+YWfmzEo6A91+F+4tZT+NK/Ab5Ee
	Ok0Hk2jZR+TEzVWCGse6yUMeIBba4t2udWTD+c8WHEtTlWliRaBAVADeEK7I+fKiuumSyr/JxT9
	lVuAS+kkOyE7J+feAJMxkFh2Hu74is/npQ/7+RNscb3XwCcKTxxWoeSJYAsob68Oqqj7fS0IaY3
	my4+KW5YIGuGKf2P2NqWMryXDJAmd2jpvsh8yHE+/T7mUrYcWPUvM27vmxmQ4ACTe8LUYrcxnp6
	ihgk0OyLnOKvQXAowqzsPr6njyfY
X-Google-Smtp-Source: AGHT+IGwFyskvE/zAPVY/RChZztBrwgMcpn3AGEmoCwsPpNCf7Q2NrsA17aBId45Km9dW2XEiyWmsg==
X-Received: by 2002:a17:902:ec92:b0:215:7fad:49ab with SMTP id d9443c01a7336-21dd7c44573mr66102015ad.10.1738166781439;
        Wed, 29 Jan 2025 08:06:21 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da3be23a9sm102792545ad.0.2025.01.29.08.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 08:06:20 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 29 Jan 2025 08:06:19 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Atharva Tiwari <evepolonium@gmail.com>
Cc: Henrik Rydberg <rydberg@bitmath.org>, Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmom/applesmc: add imacpro
Message-ID: <2346bf1d-9292-40cf-84fe-fb173baeed08@roeck-us.net>
References: <20250123121728.1383-1-evepolonium@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250123121728.1383-1-evepolonium@gmail.com>

On Thu, Jan 23, 2025 at 05:47:28PM +0530, Atharva Tiwari wrote:
> Add iMacPro to whitelist as one iMacPro is released.
> The iMacPro 1,1
> 
> Signed-off-by: Atharva Tiwari <evepolonium@gmail.com>

Applied to hwmon-next.

Note that the branch will only be pushed to linux-next after the commit
window closed.

Thanks,
Guenter
