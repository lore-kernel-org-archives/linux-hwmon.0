Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95CC2B9B9;
	Wed, 21 Jan 2026 09:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768986532; cv=none; b=FPJ1miuufAQioQaVrxctNz5FcBON1AicdbezL353gSRm5zXclw07t5oZkNyn7r8UlZmomi2xttyHiK8cLbNS+lYiqCPIqtUdb5Df8BStzBs4JGDTg1GRNQ8a3gTAjvLbWE+MDvF972Agcjex+bJ5uYqlI/aTr8/IHP7F+1kxrro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768986532; c=relaxed/simple;
	bh=VqIIabdXVC7+SPWUW6Fc4QuCC58IU4gRnmbQVB3hp4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tlV8irbaEYNFHA97ngnSw2Ns+jX6R20iOYavBWgsDvme83Ix+b/c4oQ8DD9spjUX0oEzs9Ty3Uj5GtD92BGeOXNPuRSD1NriCBr/ebn9rfdIKkiU1a/tE6i3+Ls2Y/5r/iEEwCAJhP3GsK2gEfRd80OOl9mjH92Nc+rsEl/SAPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pvKm17JL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pvKm17JL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21755C116D0;
	Wed, 21 Jan 2026 09:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768986532;
	bh=VqIIabdXVC7+SPWUW6Fc4QuCC58IU4gRnmbQVB3hp4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pvKm17JLkjF9E8cOurFCP7cFzsfirNSseKrLXymwTjWRi93gN8Z4SQ/4SFmJW5KFm
	 M7avBOkaShHHDxznZlf6cP/rVzPfnjHy8jrkEBidCINfN+U7cKApmgIl9oBaMb69ss
	 6+g3nFUY4W21JLbzQIFhjYaShakBnjiDdsLuRuFHQtniKY0jybh3Wq5awJsyOgwg77
	 JNryHoCLt7YW8bMQ00FIg0dqZEvVju8qFTvkNWkCSbCvQ575Q1CxZFONrkDA7JEWol
	 IJkpkrstK+6/sE8LGh4cvDoF4aQtRMX25mmsQ8wKduROyfrNRH8BSxx7SJs6S5Db5w
	 a1z3/HcFwcfrw==
Date: Wed, 21 Jan 2026 09:08:48 +0000
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
Subject: Re: [PATCH v2 3/4] hwmon: (cros_ec) Move temperature channel params
 to a macro
Message-ID: <aXCXoLnEZm5NwN42@google.com>
References: <20260118-cros_ec-hwmon-pwm-v2-0-77eb1709b031@weissschuh.net>
 <20260118-cros_ec-hwmon-pwm-v2-3-77eb1709b031@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260118-cros_ec-hwmon-pwm-v2-3-77eb1709b031@weissschuh.net>

On Sun, Jan 18, 2026 at 10:45:57AM +0100, Thomas Weiﬂschuh wrote:
> An upcoming change will add more channel parameters.
> This leads to a lot of churn and very long lines.
> 
> Use a macro to encapsulate all of the shared values.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
