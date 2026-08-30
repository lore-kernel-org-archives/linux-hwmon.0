Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78A73D73
	for <linux-hwmon@vger.kernel.org>; Sun, 30 Aug 2026 00:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788048154; cv=none; b=C/05HGwDU8+Uxup0v8haESadnaX9XOqsR77sgch2LmwkNKJiqvbTGrmseu1eazGsXDyPSYGiA1hCy1wjnMhfKayaR9fJIxyIDOBj4zPRZm9wV5JHQVO1wzeoic7gCrPswxniqHhUVpRo83RFpFeVq571fTFMRjZ7K9QvoamczXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788048154; c=relaxed/simple;
	bh=GUlHvTD9arSTbqzSC4RIirzO/YO/aORdXW2rR7s6z64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YyL+cQzSwae4UPjdGOVNTAB4ofvfC7Ot7ly/3TZ2bsQZW7dY3UEInGXbQa/ClZlWGiNrQmGrgxnt9vKfpJmTP+jaLLBp94DJi5bNtNwrGCUOORcH9T6hxxNHJO6w1q6aCqLv8ct72sxgeS7aDne5h0HKAEE2a8x1C3wKHth9MZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n1lwIlqa; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n1lwIlqa"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ce98cb8165so22496425ad.1
        for <linux-hwmon@vger.kernel.org>; Sat, 29 Aug 2026 17:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788048152; x=1788652952; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nFrNKIHfAjvAtlXZB+dsymuQcG0St/kcHlRdbfRyz3s=;
        b=n1lwIlqathnDebUT0GQ2bAEuR/hJ4sIt+DwPRHAbUi21bYOo0CP1nns6ZXLaA97xUf
         BQK/TSw0pP3zUhZ4Yo/NJ5QK2yZGFFJA71t4zL2BOpgTN9TABgaM/gu2IJhDsTqhmJtJ
         MlhGQSglVDotYpcm4+ZnLP5TeVSVIDgthgsJe1Ilg47SqkbLtiY+3nDONmQ/yh/vRXrL
         fHHLfGdMTd7fYl3RqPzC/QYDDgSVVfWoQjk7hmJnTJzuCFmysvPEqWF9lFlYqsUIa/iR
         QBDSuvkBrfAixfcpCT73Zt/c/YpmhXDApRcTUN0pqkMPNZjLCgDU5fFWoYmyWgXYafsd
         UxYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788048152; x=1788652952;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nFrNKIHfAjvAtlXZB+dsymuQcG0St/kcHlRdbfRyz3s=;
        b=d6YEJk33Q8isn5mFXIvMXclez3eSmYt2BaPFmd+GJMBWe9NcUfpLxmDTxw6rMWgFq8
         0PoIPFfvP9Z+pnhlglOzh7JjurYSez1skXtu9ACfU4Zk3Al1im50jdLdq/cude+i/ztm
         b3rFAQWd1Z/74ar7NMjihk6ccvEM0EjWlUP0BusfeqchhCMNgJkaPoB9/2+towJSolEa
         cRCzmlr2WhMl//J+QwlB1mdtAWvCpHsIqtrknK8shGRO62pqCmqSdBEZKO3JKZhxIvts
         1z347re3ZJWVLIsxzK9kL1GCjrbDcyh2tjTR7qkIhB5lhHjbMcatvSnQrjpA4vhpqpAo
         b24A==
X-Forwarded-Encrypted: i=1; AKwUvBxz22Q6ugsR8tJzEbFMGAjgdYkrVrfrhg5L08nyt2Wsh9vA3RTNuaT76o/h0fuEz54RGhHAJ7JNKQdMhw==@vger.kernel.org
X-Gm-Message-State: AFuF++lvws7b3hvUz31LOsQQPvPXgFtgmNbyMe3ocJQyJIRJdfoW6/pf
	s+nKamK/EebOf8SI6j0lnkbCEQ0UTlZN6FYTgEPTlS2pBpUHzcgavhem
X-Gm-Gg: AYBFou36YuIAac55/OsbdG5WNH6WnKhUDletc3U5eT519v+xZxcAOBY3aeZeNEUORjg
	mWEpYD4oFB56+XuhE9NBg+BNeTbok4rwSfqP8VAUGqwoRPJlWGPbRP3qjYNyHXmoEKK48YsL4cf
	suGpjhGB7S7Cg7t33KCSDLltQDIRfAH1FaUs5JWXRooBfQ11mHqeSht8t04kfYYLBdckJDYYXqq
	WB+liCQVfatRSjHcLSl7obZ7HXrGua/BxHPv2sILpU3KWAhfNQRtGXhe9GxA6XCLy3Y4wlpCyrb
	vgqQwAKNI0AQnShpPhZ57OoARd1esT+sMfskekrGsrKSg7jTcEYtmwhjWHNkbCh0mhijD3HrLIR
	lrH3zA6YTFcTxUTniwPTcEQIFPJNC6dJXA/idVlgpNy6yTWIpzTW13PgK5P52r6pHd2alRMzyOT
	enwkcmLJ9qz/roN55btkNzLqpKtXKlEOOrDjMQfMoR2X64krLgfZsmqlZpRVcvQYTVaU1rpHozj
	Q==
X-Received: by 2002:a17:902:d2ca:b0:2c9:d277:2cdb with SMTP id d9443c01a7336-2d8d4b64b47mr62427545ad.9.1788048152088;
        Sat, 29 Aug 2026 17:02:32 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d9055ddfdcsm2243855ad.18.2026.08.29.17.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 17:02:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 29 Aug 2026 17:02:31 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jerome Tollet <jerome.tollet@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	Benoit Masson <yahoo@perenite.com>
Subject: Re: [PATCH v7 3/3] hwmon: it87: add IT8613E support
Message-ID: <66112c28-2797-40bb-82ce-0bd8d86cdc31@roeck-us.net>
References: <cover.1788040385.git.jerome.tollet@gmail.com>
 <5afd336442307450f77467b2a749d405970a2099.1788040385.git.jerome.tollet@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5afd336442307450f77467b2a749d405970a2099.1788040385.git.jerome.tollet@gmail.com>

On Sun, Aug 30, 2026 at 12:01:49AM +0200, Jerome Tollet wrote:
> From: "benoit.masson" <yahoo@perenite.com>
> 
> Teach the Super I/O probe path to recognize IT8613E and add its
> hardware monitoring configuration.
> 
> Add feature flags, 11 mV ADC scaling, the IT8665-style PWM register map,
> six PWM temperature mapping sources, and GPIO pin-mux checks.
> 
> Only three temperature inputs are currently known, so retain the existing
> three temperature limit and offset resources. Document the chip in the
> hwmon guide.
> 
> Signed-off-by: benoit.masson <yahoo@perenite.com>
> Signed-off-by: Jerome Tollet <jerome.tollet@gmail.com>

Applied.

Thanks,
Guenter
