Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6D3299AAB
	for <linux-hwmon@vger.kernel.org>; Fri,  3 Apr 2026 17:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775238587; cv=none; b=QGHf8sGMZriOe5cVxVt/dZu2OLpRcVimrDM1nvFvc1a9uBN5qwsNbGmLgKZd8M+lMLZMXAHqCEBAhiQjUrGGdoUWyntmiLcT00QenjL1lm0l66SDIBYRRTVsEt5ke2cXIO5j6Z6zRfoTe16pEjD9ODweoCY/cJ4UYmCXD5vRAnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775238587; c=relaxed/simple;
	bh=+kz33Etq70oY4pxDx+S+raiHZw9V086oskqvUBFmWqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WlRAf6DvVzMDFIHKESJwUNfHuuMGHWgnUp7VSB14TI8YCfIS4goEEnl85AST/5g5QMn9/pQPHu3Nlh+HYWtPbv8LNNXYOZFWMlikUtC0/3OfBX9S1RAHLKoJtXVdin0kc/bluWvy4ELl1gYnmwvbLx7xzREQa3tVoh+HZhYFahg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rQFsCEDs; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rQFsCEDs"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2c5b3d8eab1so613554eec.1
        for <linux-hwmon@vger.kernel.org>; Fri, 03 Apr 2026 10:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775238586; x=1775843386; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LpeNu1hgFXX8Y/vNXlZvad44E2YPLfDtfghWdI7/yWY=;
        b=rQFsCEDsSZ8L/BMg/bJZaAuptm/2M0IxLizdoZ1B4xIk2v6VApWLik6xNatNU0vQB8
         qqttmqKKDoynXbnjhrc0wnlzcZuE0eKxSiPC0zBnR8lC16nzTlHj8jdwCYIXWIuo3yP3
         QFj91GZ743ix4axFS/+dpZOFrWaKNrKwepCQ0jGrJySG5td1sxoRFhrVimjMSecyGnN/
         RyUsQLVJjtFAs0/TGcFcJRVVpv1XGEY714AIsRG73o+O6YBuz0zRSyx0/mfSu73hHH8L
         aOYfTEm96+8C2k5sqAXHBREBNszYokRrmAMhCodXe5VLpU4oXcD1fJ8jq0/NutbQTEDu
         ATGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775238586; x=1775843386;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LpeNu1hgFXX8Y/vNXlZvad44E2YPLfDtfghWdI7/yWY=;
        b=Rtu3dDLRekY60XOyFr2vpdGqUkbu5X39lSsSop194jSOrNUleL7oAhZ/rjLJyhAHEE
         NHQu/Kyp3jYhXiKf2VPZ3shTtPvPfMFUgM5hyPThL52x3VC+Fa0zOPnX9dyP8wgea+7s
         lG7L6X0GrEvsHM6cbBvQ79Dn1Wipf1Sh7cSDvAnlgCe6OJuqeVSqRHLMEZajueuXH3yH
         aXzC6de/dowSfRDl+nHsSTjJ7LNJKa7hvWsMMrJ5/lP1Ng4o56L7Bxk44pKOXrxC/4LL
         r0860iIwFtIBeJsAybDzEuKZK92DUDaw6xXzL4paP38qjpU+oUrJs/Kj2P+EQzNcPqRo
         kLvg==
X-Gm-Message-State: AOJu0Yyg8TN+IT6yAKFtQOPAXTWS+ptnc8qj9geHAZ2Ag4RkuKSoGqwS
	RIr074HbwcsZWAvV8TjOIuXVR9z7uCL+FBG51yB+4LlRNMQ8twSfa0ks
X-Gm-Gg: AeBDiesbIRFYtAzVNGY0Ts6AkW0EBzMj7Phpoc2yWB0z/JvenIzHG5qqR3kT3Qx5I55
	kS2d33QPU14k8Ha5O0TgNHnbdI1Kw+KWFBaUEjD0YvI9hSPuauPhA03C3gOov0YNIAwOqe5qmxD
	bPZgJTIdhm69hsBG/u7KjqMMS+WZO7J1wPFm7GqEmbCUNCBqSztJ3JeTMX+T6XPoeFXo+1YbEZE
	RIs6xVZDplFiQMOAgtmDyZ+so6RjGMWNnmNWRsWnffj/6dgmmma2QBPuypuoC0cRJ98nJ7SUquB
	CjhTUPbqrmzcdUywW9SYd6/LTlrFfAnwYESG/jVtK1XVuLS0WQrcc6QY43grGJcMmpa+fLNYBlr
	9+HLg9VfZgjEeXjAr1Qp0kUOFjQnGxkhs6lM9PSzNDKLnr0/i17wWfnVTlEFCiqM0OZBAuelhrf
	FUXQIWKfnVKmU3in68o/IwiiM3+L9IkfSPoq3t
X-Received: by 2002:a05:7300:2315:b0:2c4:59a6:9e5 with SMTP id 5a478bee46e88-2cbf9ee8dc0mr1990422eec.12.1775238585720;
        Fri, 03 Apr 2026 10:49:45 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7d00f5easm5395815eec.29.2026.04.03.10.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 10:49:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 3 Apr 2026 10:49:44 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Robert Marko <robert.marko@sartura.hr>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	luka.perkov@sartura.hr
Subject: Re: [PATCH] hwmon: sparx5: make it selectable for ARCH_LAN969X
Message-ID: <f5b8b3f2-8eeb-44f2-b6c1-2ac41287b0c7@roeck-us.net>
References: <20260402123436.47856-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402123436.47856-1-robert.marko@sartura.hr>

On Thu, Apr 02, 2026 at 02:34:24PM +0200, Robert Marko wrote:
> LAN969x uses the same sensor and driver, so make it selectable for
> ARCH_LAN969X.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>

Applied.

Thanks,
Guenter
