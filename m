Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A93380FFD
	for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 08:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778918807; cv=none; b=Nm9Yt0Yi1SOEng0JO+E2GFRH8A7kSyVGMHcOf4CCUCXhUvtsZmkYleLr1ssxRkdSjwMzzbGmxKlJIVyHtpcKS0CJGNJGCb4z5DG6NdBJmZNTvDhJfrnd77NMkbpJITQ7xRIFJP3jV7FmCtJus69f9E92cZGgXEaqe61d7B3dSoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778918807; c=relaxed/simple;
	bh=4TTbEHiX19MeVhQz9SoBw/dR/1/yhGhsUzHZchpNW+0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JF2/i877VTfcfkk8Ti6q+eR/vbtPkBNtN1CjL+/qVlq3dNVzEdeWUYmVf+UQjNBQEJY2jDzgTlB2k2v25z4eEAxgTorEGTutp1QiSWAFxD6taOxqWWIxhihoPQPH77CSD2y/Fm4P8Sx1ocd4qzdwFMUnlqd9FbYx2PEPI/EVcBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cOf7KO3i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cOf7KO3i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C31AC19425;
	Sat, 16 May 2026 08:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778918807;
	bh=4TTbEHiX19MeVhQz9SoBw/dR/1/yhGhsUzHZchpNW+0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=cOf7KO3iDHiearwdS55xa8t5yjvJ+PD5HClegk8GssNPihUlm5emxob/2AbNYJEoj
	 UzvjfD+BPQLUUhzQ5HHDpzBVW82Oluoh2nKNbSoS3gkWdUx35PpwUnX1TpdpmnpIbs
	 sPIBXsY7VHSjh+MZbq7lfdj2LUP7++kyMZ8VGwcLrkY2G0hXyDUSFdvF3jsv7X7+vx
	 TDkeetVL79AlvhoFiKTJ/q46T/CpTCwizgBRlrGmFAhTCFX4iheq19WdemBc9pD1Ui
	 9Zq0XeKvlcu5ZxiRiRIXF6lXMKrtDV/BDtZbYCFXprW62MH2XHm/nB8l0JDYlkxnOs
	 sGDl7Wt8HyGrQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (lm75) Add explicit header include
Reply-To: sashiko-reviews@lists.linux.dev
To: "Flaviu Nistor" <flaviu.nistor@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260516075708.6682-1-flaviu.nistor@gmail.com>
References: <20260516075708.6682-1-flaviu.nistor@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Date: Sat, 16 May 2026 08:06:46 +0000
Message-Id: <20260516080647.4C31AC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Since device_property_read_string() is used in the
> probe function add explicit include for
> linux/mod_devicetable.h and linux/property.h rather
> than having implicit inclusions.
> Header linux/of.h can be removed and also of_match_ptr()
> improving non-Device Tree compatibility of the driver.
> 
> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>

Reviewed-by: Sashiko <sashiko-bot@kernel.org>

