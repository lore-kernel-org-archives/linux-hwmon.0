Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3E5127B5D
	for <linux-hwmon@vger.kernel.org>; Wed, 14 Feb 2024 19:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707940658; cv=none; b=bXQg/kI70V/EKRpyPjgSOltZ/I81N1RaUkf71BCdCckJ1m9EDgSZutvdxr9p67H3eOhC7Ekwo8KKQBcSHYdW+6cpWOJ+MJ1hVNk3oAUbnl3ndFjeAwKANGs0rD/Bhp6o1cYTSVQs1PloSPJs+aKsfYBQcRYBMva8cco8BOTZEYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707940658; c=relaxed/simple;
	bh=OIVir4TVc/KiE/8PF4h9kvKg/OEhYo4qNqUX9wLbsHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TBk1m5j9Mn9p3jKn0KxrO2XWUX9BbY0/BerFezGBS7UJxDlCaMbOMo+yHggAOamYLYpzvnv4jPD6u69/+TLREH1Bk65JRS7MZoQ3oUog9EmGo/FiWiksaHpyV50kFOIs7E+zsQDvq7kOI6TzvntQF5yG4FIzERc+qeH636tTZJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Os8LIm2P; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Os8LIm2P"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2971562c3ceso131375a91.1
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Feb 2024 11:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707940656; x=1708545456; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yY+1d1Z57QcjP7yYVXzQtGpUN9OQ5n/EnvpuMBGrdrI=;
        b=Os8LIm2PRL/l//CnLx2x9RQj25wxgnwm5RSY0oymBsvj/tsuMmICCGSSLBYhgCU0Kb
         U1JbOHMwS4eVQ1onkxskfgDQW/HNTOtVRVORVW5Eq8bmn57ReEVE4wQlD235/ajLtbTF
         +6z+YLd75wTDXlAb/PPFOW2bb5CY7JXyQCKBrnNyX5zIIRCCjCErczjcIrGN4eNLv+4h
         NRItTZipJES6dDV166i26MMzClfHFZSF6kY3+zyQ8utlaN2LIDti8OIAPNcZ7smt/hb9
         LSkZA/d4Gk2NRijvA93djg/5VQP6IDIa1rXNJR3rODExwJMUlzpYgpsniKlYGnelHH27
         wu6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707940656; x=1708545456;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yY+1d1Z57QcjP7yYVXzQtGpUN9OQ5n/EnvpuMBGrdrI=;
        b=aYdffLGQTyovbwAM+WVNXmk31n8I0zqO7Mvw4qksHldYUtypG2jmsIbZlrEiU/QajE
         iZmuBekZAuupB/nSyH/xE1NZr4XLHKAO6hyTuG56FY26WnSTbOnau6pnNZ64i9tOfVoc
         6+dtGwIMscWtC3x+MK4dCxeY+dUnPy8hQqmfFNH5h96M2sf2rylcmQqAdQZH9dq3oCm1
         ThvMz3Os6rPaiMAURL0UDEJ43sh/sGHYCXwhgHCxh+IUwv8lIfCEsr4gUA78x59KFSpD
         hHBVSv6Hz4mYpwXy5fwCdpKXkQTe/bZVRyUr04lCRvN5eC4YOluNTod6p/aqW/WE98Zt
         qxPA==
X-Gm-Message-State: AOJu0Yyn490Zq4Uf2cQHtPF1fjoaojuNmy6F+3uM8W8g3UwcJuHytdwi
	OyS136qtG5GEl/wAks+SwH9pMTHoxXeMZ3lQ1uXpPKxD8sYYQDBXXnYgzkZ8
X-Google-Smtp-Source: AGHT+IEG+uzz4EkvZySJJNQkapMBQUgnjkYmZ2WJYVMXWW9qXYpPx6hlMGdx43Ohxuh65zZHK5Kjrg==
X-Received: by 2002:a17:90a:1f4f:b0:298:b042:a167 with SMTP id y15-20020a17090a1f4f00b00298b042a167mr3250019pjy.49.1707940656399;
        Wed, 14 Feb 2024 11:57:36 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id nb5-20020a17090b35c500b0029732fc0154sm1908825pjb.3.2024.02.14.11.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 11:57:36 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 14 Feb 2024 11:57:35 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Nuno Sa <nuno.sa@analog.com>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH 3/3] hwmon: (axi-fan-control) Make use of dev_err_probe()
Message-ID: <c8198081-242c-494c-9ddd-e836fa77ab83@roeck-us.net>
References: <20240214-axi-fan-control-no-of-v1-0-43ca656fe2e3@analog.com>
 <20240214-axi-fan-control-no-of-v1-3-43ca656fe2e3@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240214-axi-fan-control-no-of-v1-3-43ca656fe2e3@analog.com>

On Wed, Feb 14, 2024 at 03:36:45PM +0100, Nuno Sa wrote:
> Use dev_err_probe() to slightly simplify printing errors during probe.
> No functional changes intended.
> 
> Signed-off-by: Nuno Sa <nuno.sa@analog.com>

Applied.

Thanks,
Guenter
