Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5291DFDAB
	for <linux-hwmon@vger.kernel.org>; Wed,  9 Oct 2024 20:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728506942; cv=none; b=KRm86lU5us/Jd0FDimXGe6RFEPx9FBijU1dF1SFImMhvz9YMXr1XUlNANJeKfN9IVvF+z/jab/r2JL8wC6iXdDyNqaaov8DgRO/BVpmuT9qvCeLnMwklP29nnPrcNzwAE0OTHPCbv+oJoyyK6uVjFkGlqwiYqEtXbIHaC4MOsiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728506942; c=relaxed/simple;
	bh=oBV2l7OvWWwrkWSl+S4PG7maoxwGsH+4PpWwTX950m4=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=u+iUDjHDJhUuhF3iFADlXOQCB8AXbrtbXNh9dvyr5eESxv+hCbdJ8QD2oQZdZKY1iNvftS7u+Fm+Vk2coP+90iKjDwtObUDXsFvA7vJv5C34C66D6Sid0TRL/FcrFiPE2PIknNBndsWviRsTfXimaxAjz66c5gteLtsrs2/e8ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AZ0SRVVY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AZ0SRVVY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74191C4CEC3;
	Wed,  9 Oct 2024 20:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728506942;
	bh=oBV2l7OvWWwrkWSl+S4PG7maoxwGsH+4PpWwTX950m4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AZ0SRVVYJFjLK04UBxqD7WPt4+kg5vdPNHfgECiwqnAjb/e4ITaaKCfa8KPe3yocH
	 3hQ9B/9qaJunam8wFlthO650LSc0+POK2Ngi+9VM4tDctKhIuOtkCYVlJyR+3DQNft
	 g+Jdr8gsgpdoNi0SG8+86aOTZ3mChOfXDc1h83WOP8THdvSa8U/nYnq1Dp/ZbAaQBu
	 hT1Su1tPddRoQEdo6WMt+LpqD+D0JdQ5aQ+iPZusHLJFI0prvzqhb3MFNGBuxiaDQI
	 kF5gAvJzTY/eES96/pVJLV/O6y3W6DdoxyNNat0INXVYkpbPfw8O5y9K4kpZMDYPMO
	 FiIXCg4x44mUg==
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 09 Oct 2024 22:48:57 +0200
From: Michael Walle <mwalle@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Tim Harvey <tharvey@gateworks.com>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Xu Yilun <yilun.xu@intel.com>, Tom Rix
 <trix@redhat.com>, Jonas Malaco <jonas@protocubo.io>, =?UTF-8?Q?Thomas?=
 =?UTF-8?Q?_Wei=C3=9Fschuh?= <linux@weissschuh.net>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Maximilian Luz <luzmaximilian@gmail.com>,
 Ivor Wanders <ivor@iwanders.net>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, linux-hwmon@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/9] hwmon: sl28cpld: Use new helper hwmon_visible_0444
In-Reply-To: <a0226799-0885-441e-91fc-fdc548529433@gmail.com>
References: <3aecbfc5-e11b-4425-9c6b-88dac2d32945@gmail.com>
 <a0226799-0885-441e-91fc-fdc548529433@gmail.com>
Message-ID: <b0351acc5769462c3425dcc5e9451ce4@kernel.org>
X-Sender: mwalle@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

> Use new helper hwmon_visible_0444 to simplify the code.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Reviewed-by: Michael Walle <mwalle@kernel.org>

Thanks,
-michael
