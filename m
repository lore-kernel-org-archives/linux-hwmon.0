Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8001372618
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 00:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785200257; cv=none; b=Eppoy1Y2ijq0u787FXpzu8N/GxDAGSjjEDLKR6Kc9cgAPb/YN0mG11MAULMMlOg5gJUd554UEks/XBfke9vy1HvI2dR8DqMtd/XMF8Evj7u7PFoKkhbdYBESqX+xqXvng3PnRsg66dlblzYVghxw8WOnUm9uEGnGJcvDCPWQTXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785200257; c=relaxed/simple;
	bh=r7Xt4sAN1oMMGOrDoEkCQxEemememLGVjRCSa6gxa1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gJj//ZgDou4BSBqdgGU4u1GFUFQ5KUMhtDuvOQnCGv3SwYHtAME1vEEdBRGHfLqCc3p2kByW4hWrdCuX26OzkHZ1l60zU2UwazVxXBbe6TJ9pUVIji+v8QoFf0hyzxr2zi9sJouci2K+nE0v7Dx2NsrsB3nV9OaLfBqNzZ2BgTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lk8BA1YD; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lk8BA1YD"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cacf197759so47225915ad.2
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 17:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785200256; x=1785805056; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Qto3bVGMAs/3+VEzt+gxU2EaDabuY+anOP1PDkQG9cg=;
        b=lk8BA1YDwDBlfXA4C43KrCkzrBUe5RzgxKjfXDkZ3uWNugp+ZXm/uV3nLevLlMBczf
         twGXNddeM+xJY/ybqefreMc/syGA9kfDHOGlm4uMiijLuwBKPWOmGdA7mo7BN35OqapO
         08u+wG7MhX7K/nqw94R5f3JlnUqOQeozn2JHTpfXWUeIixEWcLBqbHl6mFEB/xy2tpnW
         fGNpkrfbNfHW1XD97r1YL15h4sAG0vGyxjQCv1GA0+68I5pd9WjS5h9k57X27RcZbFEi
         V5V6mZ19WUArvX8/O8su06lqLQ3jxMQMuSbAnviVbXeny3160066yUO2rOmGMirLdJnC
         d46g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785200256; x=1785805056;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qto3bVGMAs/3+VEzt+gxU2EaDabuY+anOP1PDkQG9cg=;
        b=glN2efbFV44dMSgpZga+H1iHGWXkFWNGqlFSUUwjY+715C31/Z0/IrLZQWzD36dGpA
         dJbOBtLuG2iCtyfEaeNT0sXS+mpycFPpcguiI2PRauorDNwpHsiR/UX/GiUFNPdNbWyJ
         D4aSysJTxSRAS/2/wRoncNy6Y86ZKYhVWBHtyS5vdciSHjPs+dhZUVDWTnAH5X1vYLV8
         XZAn3zkjgopZndLDPVZb4CDsnb2GGXFtXglgIMFNbafxbq/5Sd6mWinrhF9EqjlrsSYz
         ToIWOe6kIDJ4qDN79dVbMX5kAqlRdw/NX+XxF/OHlKniSKHDv169xa7l5zehBWZzwBGe
         k3Vw==
X-Forwarded-Encrypted: i=1; AHgh+RqMaa1g3J39Cq3Kc9iFHEEmro2ehDI9D/RzxnckJSeiPHdVkYiG3yBdzA72lA6GuBElUSz9UDTmNI2zQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEniICgdsI81z2KbE+TlSNFFEqorv+To4hEvgHpr6uJXkSHaDn
	YAE7QUrlb+RmczqbXjIFuoUgH3KYTTwmg671OiVa5lHdUcFerJ15nijk36mllA==
X-Gm-Gg: AR+sD11Jy0VRyP5OH3RPRQKqPwH07FtI6Pi6ZNitXm0Fzzgzn2Hh80KhLcGSJs3e9kY
	hyhdnVQPPiblbYDywJ27AWLB+yTOyKNQqvR9NMA+DOObOTr3Y8HZaiAMKEhJ0yuD9xqGCyHm1vj
	WXnIli35cwUldm+7/lM8D/wS0YfItGn3ogJFvQFj3LhNw6s17EPylqb4gtVnLSaj9J3Et5LQmjr
	zIHxVcvVBbp4hI1v+5i9FbRAaRjB4ysaJfHVLAWGJjiPVSGCFnsDxoiZCOMSdGRhPwMx5QfiFLA
	lKHk5tWw/m8XnmEDrsHqAyzipc4fVXPaop3aJRHfYAiLjPXxPQBJiRzWAFAJnfLyznrWvFkxRlv
	mLDKO0oEkVC5H8aLLob7CHWt7PqDhqE9ZI7Lm+ViPApik/WXxHcZZ/dqnpsW4uooDIrrpkabjjA
	lXA/Am9HuYB3QFtAbuEkPYRkJ+pA==
X-Received: by 2002:a17:903:1844:b0:2ca:d91d:d3a7 with SMTP id d9443c01a7336-2d015c9cd4cmr2532745ad.10.1785200255750;
        Mon, 27 Jul 2026 17:57:35 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde5e8a44sm43786245ad.35.2026.07.27.17.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 17:57:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 27 Jul 2026 17:57:34 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Darrick J. Wong" <djwong@us.ibm.com>,
	"Mark M. Hoffman" <mhoffman@lightlink.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [hwmon PATCH v2 6/8] hwmon: (adt7470) Use cached PWM frequency
 value
Message-ID: <06aabaed-98c3-4b06-b2d3-acbbd35e2309@roeck-us.net>
References: <20260727-adt7470_fixes-v2-0-598e38a46ba6@gmail.com>
 <20260727-adt7470_fixes-v2-6-598e38a46ba6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727-adt7470_fixes-v2-6-598e38a46ba6@gmail.com>

On Mon, Jul 27, 2026 at 09:22:22PM -0300, Luiz Angelo Daros de Luca wrote:
> adt7470_pwm_read() currently ignores failures returned by
> pwm1_freq_get(). If the register read fails, the negative error code is
> returned through *val while the function itself reports success,
> potentially exposing a negative PWM frequency through sysfs.
> 
> Fix this by using the cached PWM frequency maintained by the driver,
> eliminating the register access from the read path.
> 
> Apart from the corrected error propagation and using the cached value,
> no functional change is intended.
> 
> Fixes: ef67959c4253 ("hwmon: (adt7470) Convert to use regmap")
> Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>

Applied.

Thanks,
Guenter
