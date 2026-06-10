Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192F51A6839
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 19:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781121063; cv=none; b=E/4rORLFuo0biXFWpfn1nns8xJ7yIC7Z2Y7o/nWO0SOmyPqysbvOqnBvnIV4jp11xDm3vtCzmrayLwkMBqeTLvJEOAoQ1IrP18WE5duK2htr4UMwvpCoAJlGbv4AsGZfMnGJyETgnEVClonZRcNq58OfGFyHsYK/yZsxUopM2oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781121063; c=relaxed/simple;
	bh=hUCfQs7KQV98K+RK8rpTrfjrb7Llur02mD4KOdXsaLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ehaZveS4y2c6JDnopT5ZNBdVB49Ky84FCkOe4IT7m8OUQVPg0riXDssI+MV2iUxqxdmbgy3CFWY7OPICSc7zuyKQywu+wLWbePO/v1PmSE8HiSG+Yh5hO4eZYfhgIO3/7JKSVhKYR6KLb4DrlxRa3S2736lbHNw4/zdEzotYc/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nOAD7bbo; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nOAD7bbo"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-307263ad0cbso10074834eec.0
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 12:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781121061; x=1781725861; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/6nKOXSea2rAp540lVxyC9Nx0wjg3EWyE8ubZisJrsQ=;
        b=nOAD7bboDlIrQgVzT4pKY0SL5xGsbM2+UWT501fb7PveIDNw2jnT6zfGW7f0s7FZPd
         A4LmApSTC7myOEa9eDQk7JyGe06yTxkYQlDlccOT0elMv6nVi+fV5HryRmyUr2sjBbC5
         GRXJtdwZJqewCgPWIQ0LPPL/tb7mF2eqYnMMCafISvasv3on1fbIHEe++Ud3CEhYWBJq
         xsP5o8cSH5issK/kxz8uhLyphBLidx+GAFogusNgvCvLgfwQ4o2tVNzCX9e6oQFArOAo
         e+IPc31SSxt0O3ybtxP+3OilhE2F8k/0glvAAlcnicAEIDQbGMpRxUVTjEDBl2taF2uA
         J0Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781121061; x=1781725861;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/6nKOXSea2rAp540lVxyC9Nx0wjg3EWyE8ubZisJrsQ=;
        b=k5NbSFofgjEM6jzzRmVcIcfBUe4SZxiAG7SQ8qEQinU7+P2qr9ubZs5JBSbLRVSRZB
         2UYndNeXcEeCqbDQ21gPCjZCQd5/b1Kv0qYU99RT2ume3SuF5QB3/TY/qOsAtB7QwjJA
         VQr41MIwGzfPWsOhV3KDkIJSA+m9/vPMfN4iz9hyjJ6EHdGk43gZ1sL3+xLSwFkksNTe
         6NOgpftSaDqTYmgon3uayTpOjrd4DHJ2x1T78dTc7NJDm4CPH3ZT4+kscRP2ZL0t83/E
         sFSTBsv4s0dIGbJqnNsoiyEVVlEwOu617Cp7rjwKCJ3KK7aWyKTWBDfpmqr19Mt3+2pl
         HK3A==
X-Forwarded-Encrypted: i=1; AFNElJ8BqA3D5MSvLBaeKOa7hhgbLE7tL56fCHXWEc22f6VhwJ1azxpuSdMVmPb0KUgR4mufI/baPA5oOMmNHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwlG4dthlLcl9mDuPmPTQL/JsAG+bTqdCUt2NhOcTREBnQqQbk
	3ctjJ/zjd5U1KzVE/DGP1ndX4ZVLGLMOP9JSZpj/I3zdGbjgWHO5tXjl
X-Gm-Gg: Acq92OFCoebwB1UosKy12vEkEVI4sKoIodyWt43OUcHvX2mh8hz2u/jm+ou4/rgy3A2
	cF1RjAcfmMM1Ten3ogAAZngj3ynPllVujp5HOsIUc1ZtcGRN9oAOI0+Y/5Z0lSbbxr7kHJVQomO
	DKE50S/d9iO3ER8UayLel6/xIo8QknMiQ7QLNSyOYPV9/ex87wCKg/lpd4pKsK8qQFzPsh70npc
	if2eF3Rt3TAHx4upvCt+HNFS1Qa+mHV4jr2IuX9DVfMuKqHnGanzZ9niV9Sgb261ZL+ymCpK+zU
	P79IgLGs9ipXCTUpW3aWQXweDdWKaduQqTxvEruQFCHl/4n9LyM7liA+Dt+X6vIdsDKPJv9zEte
	WMPmpt0jAac52juzxZ6CUPt+xDlebKA6d/6F9RuItiIOkNcMhRAwp6cIO4yZcOjM1bFHi7geHlj
	KIW6XOmCbjymVuQ3zSN2v3X78nenxz4hl5Ca6+M8WEdFKtW70=
X-Received: by 2002:a05:7300:7313:b0:307:26a3:75d2 with SMTP id 5a478bee46e88-3077ae86b6emr15661380eec.7.1781121061194;
        Wed, 10 Jun 2026 12:51:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dea8e8csm26791373eec.16.2026.06.10.12.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 12:51:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 10 Jun 2026 12:50:59 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Armin Wolf <W_Armin@gmx.de>
Cc: pali@kernel.org, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (dell-smm) Add Dell Latitude 7530 to fan control
 whitelist
Message-ID: <43b8b294-ceb8-4d30-9a6b-09aa836f7ff3@roeck-us.net>
References: <20260610180141.311503-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260610180141.311503-1-W_Armin@gmx.de>

On Wed, Jun 10, 2026 at 08:01:41PM +0200, Armin Wolf wrote:
> A user reported that the Dell Latitude 7530 needs to be whitelisted
> for the special SMM calls necessary for globally enabling/disabling
> BIOS fan control.
> 
> Closes: https://github.com/Wer-Wolf/i8kutils/issues/17
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> Acked-by: Pali Rohár <pali@kernel.org>

Applied.

Thanks,
Guenter
