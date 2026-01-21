Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC40314D14;
	Wed, 21 Jan 2026 09:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768986547; cv=none; b=O+bxABkTGwpUDtWLkAjNLthwupu6Q7mf9X7KySMDmubeFN1z63JWKjuBMISRWKcUly9qVharenKQvytJZUn2Z7Kchgj9XFbG6zyKSrk6nUAfaQPW/BjqNWGjABWs0iJNpOzcfIFBFbxzR7kbe8dRhGHDzFK2XW8fFaRk/TzuwpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768986547; c=relaxed/simple;
	bh=wB5YGwNv5kDvyaFLjlC9JafOot+oNpD8z6lWTCd1QBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QSsq48ZvvTA/5cCuN8L5Qw1SO/0/fC0ceIcxbLPAPhZdhQyqYD76kTaOxanXQO3Pcv1koBlXL24TVx5emsNJAxR486XoO2wI9c/jAKg3vW9hfW6ATMsMkB1yYOmt8fPCvIusY+fL+3scJ8Omk8URF/YLZ6dDlotWWTyzXJVrGVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vQO1qqpg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vQO1qqpg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DE07C116D0;
	Wed, 21 Jan 2026 09:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768986546;
	bh=wB5YGwNv5kDvyaFLjlC9JafOot+oNpD8z6lWTCd1QBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vQO1qqpgxlUzT+uJ7O7ZkexdSAz6I2etQaKMPLDzBTUpAdIkT4YHfMwkUkKKR02qE
	 1iSQRfDj5z+8TfJzra1J3I20Z2zXCzsrfHaGuCVsYmsSVAB40mQvXQwz8gZRO0t/pN
	 21r4PS0KJMbBTebndbOxZRcZ7G/vP4i9+G14cQ69OWeY/hXZc40afr3odyZPbdYjdZ
	 BOAH1YyfOjXF8cxkeFHXJ8Sm8ndtmS7vdi9FMNrGhb00BTciOP1majM+Wbr4kat+d5
	 C5AToSa/tIqmUti0NbhjTWOPU7JwlYB+Q02tyjEHzQpqVoLjPKjwF80qaAqEC+EGO4
	 oZ2vAdl5hY8Qw==
Date: Wed, 21 Jan 2026 09:09:02 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@weissschuh.net>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>, Dustin Howett <dustin@howett.net>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Stephen Horvath <s.horvath@outlook.com.au>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, Sung-Chi Li <lschyi@chromium.org>,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 4/4] hwmon: (cros_ec) Add support for temperature
 thresholds
Message-ID: <aXCXrqIvBPrGj0bl@google.com>
References: <20260118-cros_ec-hwmon-pwm-v2-0-77eb1709b031@weissschuh.net>
 <20260118-cros_ec-hwmon-pwm-v2-4-77eb1709b031@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260118-cros_ec-hwmon-pwm-v2-4-77eb1709b031@weissschuh.net>

On Sun, Jan 18, 2026 at 10:45:58AM +0100, Thomas Weiﬂschuh wrote:
> Implement reading temperature thresholds through
> EC_CMD_THERMAL_GET_THRESHOLD/EC_CMD_THERMAL_SET_THRESHOLD.

The patch doesn't use it:
s@/EC_CMD_THERMAL_SET_THRESHOLD@@.

> 
> Thresholds are mapped as follows between the EC and hwmon:
> 
> hwmon_temp_max       - EC_TEMP_THRESH_WARN
> hwmon_temp_crit      - EC_TEMP_THRESH_HIGH
> hwmon_temp_emergency - EC_TEMP_THRESH_HALT
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

With the commit message issue addressed,
Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
