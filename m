Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C841AF4DE
	for <linux-hwmon@vger.kernel.org>; Fri, 30 Aug 2024 12:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725020973; cv=none; b=Y8lIEa1zZ9wf1YYClqnSZbxLOL1E2rpdhK8Zsqxh9V0qP6Mh0ArFiGyzv3NM3JbT5fOtIsQ3pAt259tntBm0X0QChgJL6tuMqUALxCgASRvgtW2rbEmtnvWxS+oX5czsLHFknc01FrOQzPps3CM0aCdbZ/A9MnITbqteXOBbOJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725020973; c=relaxed/simple;
	bh=fWm9MXZtM7FTrztj6OcmTdfwDwJrHBawk0Rq/kHa74g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MBVNOas9kBpDVB1sK3FBZU5F/mOO+A2Rich+7/VNYaJzsH/dATZBsjlZGtvojFkiM9PyN0xVAiOmMliObtzEFfjFl+Q0gGJs3YV1H4Nec1EOPV6HWLHXNnNeEDZSBlXekrbwMiDQG/3mVYawQeplNIjQsWtvMclL6pLizyuW+6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KSQQ11cG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KSQQ11cG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFED3C4CEC2;
	Fri, 30 Aug 2024 12:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725020972;
	bh=fWm9MXZtM7FTrztj6OcmTdfwDwJrHBawk0Rq/kHa74g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KSQQ11cGeeYjMRPv//fulnzE1KjEiCPNmZRJU7amo2+zDzsp7sC/71B68qNoR7dP5
	 zmID94AE+NCFO970DNKI/h8SJ+4wD+2F9L/r11fID5GtlQlkPsX9ID4FjfN/19DwW5
	 NBDKjmngm5QHTf5TBGyYnKzVs1rTx4obljIeQhbjgsnqszerLc0tWCwNuvcxtet3fo
	 W3VV+LD/I44mIHRRPM6lDEuZBBX8sQeaGNAaQ+q8Jd7Tjy/cl+lrKnCZx7w0bCzkQC
	 V1bMc3vhvCtpIbttqA7uFHiZQ9UCAf9hAJzEaDGwDPHdY4qX0FFSFOtmQXExJmKt4n
	 NPjQJdI2x/Vrw==
Date: Fri, 30 Aug 2024 20:29:28 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v2 09/14] hwmon: (ina2xx) Set alert latch
Message-ID: <ZtG7KFkD56W3rLYe@tzungbi-laptop>
References: <20240830010554.1462861-1-linux@roeck-us.net>
 <20240830010554.1462861-10-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830010554.1462861-10-linux@roeck-us.net>

On Thu, Aug 29, 2024 at 06:05:49PM -0700, Guenter Roeck wrote:
> Alerts should only be cleared after reported, not immediately after the
> alert condition has been cleared. Set the latch enable bit to keep alerts
> latched until the alert register has been read from the chip.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
