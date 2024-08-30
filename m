Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB76B17ADF8
	for <linux-hwmon@vger.kernel.org>; Fri, 30 Aug 2024 12:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725020925; cv=none; b=jf78/xQa0Vb7fk+LI5pQ8FSveUyQXcu0VmFh4F4/mYhuSjnNx2Cfj5+DrQDCg96Df/rVWAL2p/45I2pBz9wQ3SfVjP8GkfsaVX1/Kmz4o8TQ6cHDeZpB/htg42Odtm29elgd9Bi17zhJxzbv1Cv25YuDecVt8PIOgRUg640BDOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725020925; c=relaxed/simple;
	bh=bjFRbOGRM3atraCr8MmewxpQHM3vfQE1T0cWGncIKd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gtsxb9yUbLNNslbDs2J5AO5+wM2CVSkEODCyS86gdXo/mTER4ZkkE4gwW6kG2PeySoHxD21mPFwzmRcIK8w1ayHjPOoRifPN/WmDkHKiOvKW0thyQn8kQ/9CHSIJnEsDaek+BC8HHyIK+qrzTKQfdcHJbEfZYqPbhgQNwyLz55w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z+tFxyWs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z+tFxyWs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04458C4CEC2;
	Fri, 30 Aug 2024 12:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725020925;
	bh=bjFRbOGRM3atraCr8MmewxpQHM3vfQE1T0cWGncIKd4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z+tFxyWsk/32DFhsnWcvK4buDQADh9i8F+h5ftDj5hSsYv4uZK9s+P3js2s0HchON
	 qayytQWVR8XPEQmbDQC585MIE+oG5CWmpstgU36UDvFtMutsGTOjtRA3p82WCc3ZU9
	 fr7AtSPdpEX8T5Dlj1+xc2HwG703wnK7r5uKaY4DvgRVlevc/doz3l1Drx1smqQByl
	 gS2MeC9tbHpi2NLZc6H1DujY0tcm+fga+V9IdpMaw3/zmgzhD5y9GDtFM7khkCp6GP
	 BQWnT0TSsPllVMrJwtmzmqdwBanSj40l6IimL6FdzAksPMCWiMicf0x7yKR+WK6TaU
	 AkfxMQNJcDKbQ==
Date: Fri, 30 Aug 2024 20:28:41 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v2 04/14] hwmon: (ina2xx) Mark regmap_config as const
Message-ID: <ZtG6-ZCtVNlpqV42@tzungbi-laptop>
References: <20240830010554.1462861-1-linux@roeck-us.net>
 <20240830010554.1462861-5-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830010554.1462861-5-linux@roeck-us.net>

On Thu, Aug 29, 2024 at 06:05:44PM -0700, Guenter Roeck wrote:
> Recent versions of checkpatch complain that struct regmap_config
> should be declared as const.
> 
> WARNING: struct regmap_config should normally be const
> 
> Doing so reveals a potential problem in the driver: If both supported
> chips are present in a single system, the maximum number of registers
> may race when devices are instantiated since max_registers is updated
> in the probe function. Solve the problem by setting .max_registers to the
> maximum register address of all supported chips. This does not make a
> practical difference while fixing the potential race condition and reducing
> code complexity.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
