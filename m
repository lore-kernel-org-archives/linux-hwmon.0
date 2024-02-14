Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DBE127B5D
	for <linux-hwmon@vger.kernel.org>; Wed, 14 Feb 2024 19:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707940559; cv=none; b=QlMupSh0dohTP8AM6gyJVadMMsKPJ/nB6e+gNf6RjKLIJwsoRPMzlgxWkhoWBCxfpmYkpvgaO1yX74xLPDjMJYjssvrSNdBJS/Ws6UDfoe99vfIvYJhhPoyl9SFXaFIE+q4TAk04V0zm+b0FLIzzc8MDAcKxx+g+fV76zfuWoEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707940559; c=relaxed/simple;
	bh=GCFUf/7PD75pM1uBV52uSa8lV73Lltj2GF1aZcZqCpk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wq7pfekvs6LoHaMeW4B9NEXKOtmaiSgleMZF6GooZGtmSB44kqJ25JFGxTuMU/TY18qnM4lh5Ft4xP+CQFLorPjc6KLGKHDv/29gvZvT36gcDG2vyurhqKgzzVJc9XJXIARGhuGyElHREdqi7KFAnuHw/cK9twqHN8pyVYYbyNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gnH8NqzS; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gnH8NqzS"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-5d8b887bb0cso111248a12.2
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Feb 2024 11:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707940557; x=1708545357; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gObMDxZaqlnJvLAuc5d5ePZWhYESL5mQMZPRv1KxVqE=;
        b=gnH8NqzS7IM2/Gz78HUOYTYiVAwwC8g7vpxVMS4E/aJTvXDh53tI97Ur2KrWxd8ojv
         BqjHw7Y7PWuQXWwnY9nbdacJKiDga66Ou4cMdISwN8URUlwWAFBhtNfj/YUeZZqbMfq8
         oHYZmvFUrxQuc3yqba77cfAor9pZfS3/EQBzBhx24bjVQ0YANxJu2D2pe+HDZtwaP0EN
         zsUW67B+ar14jNaG7BDvnvhFfOKgjDcYgUdaZ9kP2zOdIM7AU2YaRlwVn7cf7728APQX
         HbPGivSjOMbmD2jnW8hkNaobA4j/n1Hc42qSDNKQyvGXyxZRG/r07cxfEs0/qiNY0LBX
         iFQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707940557; x=1708545357;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gObMDxZaqlnJvLAuc5d5ePZWhYESL5mQMZPRv1KxVqE=;
        b=MZGTcmxAUTAmt9yLTY/lLVIfZfWBEqAOJtjH6unXrKx3MYyEuLMMyhXofR8f4eoT91
         AEv0gbuLa8OvkNwfAGbG89WhvulXJ9t3HiKy8TWb3yYhY3pd/cuSTOYFVBNo6uBK0qh5
         /pPluHEgOkbNaV9kN9hqEVjn4dLWp5lDwCWY/nqCDCUlT5XvzIu7DWadsX9Rk+/I1eZ+
         K1jWj4f4tgeuh0mVBRQen0mJtioiCJiPeITfxap0MZazn6DDzBw3XkQmOKM7Zp1txkXq
         A0IdF8EjLFsFEAKQt3gIlQI5mO0wnhjJcvBrsBsf34dtjb+VWyHA/fvztI3cuVyt7Dx3
         TPhA==
X-Gm-Message-State: AOJu0Yyq52MWFQIoxdNUQX/9lc6OYewjzeqaAem0Yqfz261+vtthr1uZ
	rJ3RDF35muZ4+XVsQalnWpmuq7U44fdN2nQJF1riWsUB159hRC2u479PP3aD
X-Google-Smtp-Source: AGHT+IFOCJoRicf16bIaOlMdyLI7Mafu7xK+97FSDwzFhSa9VT/eYjz86ONyLXCx3e1mH+hts2xXlQ==
X-Received: by 2002:a05:6a20:9f96:b0:1a0:6016:bf6f with SMTP id mm22-20020a056a209f9600b001a06016bf6fmr3925729pzb.29.1707940557611;
        Wed, 14 Feb 2024 11:55:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVP05m+F0cuCqriWaKBMs1mCz32ohuYPs69Y1K+ln+BaDkpD86ba+LRwbWk5Uxk1ap4JgazQ7YrQLq7J9MWfB5Png==
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q23-20020a638c57000000b005d6a0b2efb3sm4639728pgn.21.2024.02.14.11.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 11:55:57 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 14 Feb 2024 11:55:56 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Nuno Sa <nuno.sa@analog.com>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH 1/3] hwmon: (axi-fan-control) Use device firmware
 agnostic API
Message-ID: <d6af5d87-0260-4bb6-806e-2fab83e2a3b4@roeck-us.net>
References: <20240214-axi-fan-control-no-of-v1-0-43ca656fe2e3@analog.com>
 <20240214-axi-fan-control-no-of-v1-1-43ca656fe2e3@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240214-axi-fan-control-no-of-v1-1-43ca656fe2e3@analog.com>

On Wed, Feb 14, 2024 at 03:36:43PM +0100, Nuno Sa wrote:
> Don't directly use OF and use device property APIs. In addition, this
> makes the probe() code neater and also allow us to move the
> of_device_id table to it's natural place.
> 
> While at it, make sure to explicitly include mod_devicetable.h for the
> of_device_id table.
> 
> Signed-off-by: Nuno Sa <nuno.sa@analog.com>

Applied.

Thanks,
Guenter
