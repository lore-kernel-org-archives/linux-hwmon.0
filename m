Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5C213DDC0;
	Wed, 10 Jul 2024 23:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720653896; cv=none; b=G0R10VotOeOdoEctFE0FQi33eETSgYdfeaNBu4tZeDOfbNYPRws/LNnPxnglUDkc4Ia3fyHdpEMRR8DG60gZPlgtkoh7hAtVURshQE0nClgqejyiC4I8/4Zzy4K+0jvgf9jUd12j6PnROJHyUFEfx7HaqowsnwHojuLaXlKQlhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720653896; c=relaxed/simple;
	bh=A3coxChkmt0sW/kbzFpptkntvbuKBBJ+zpKIjQW1Krg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=n2VBIW2JkrAT3zFHK4+d6N28yoe5oYt/m406x8Cu1hVbRcaOYoqsHMC92HhsiWFz2XWz2iOYAHPDJX/QEduJPyZclltLjrwxz53kj3EWmLeTs/GanB+naSq1JOVsgjJz6xFxFKY+Wx1wYzOAv78cECQtomCpeJfaeOo3MWEMS4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NmoRNHVT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NmoRNHVT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BA9BC32781;
	Wed, 10 Jul 2024 23:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720653895;
	bh=A3coxChkmt0sW/kbzFpptkntvbuKBBJ+zpKIjQW1Krg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NmoRNHVTlz4xIpvn31hnhnPptF9ngE4EXyBHWr+GvE8EvaiXvCHS3rbkVWpcsOFPM
	 YTlmTUse3B1nL6WnbAjJZ80ZNc3n3EinLbERsnEaYIkNjLGcpftNyhIlGxrJqq/FzN
	 6nrqOMWKqakDfEUkz5gDrBkE4CpkTwpRFjMSdXLY1RJzKBQKV5/1gCtAlxLXKxwUIO
	 EBZ+bN5rKTF+BO7kFEpkg1AqJfGKM8JJi4CW0YHRFbv6VtrgShy1YSvfTcxYD9knTb
	 4qYvNl0R1ZlLEfP012bu/p1RdvU0b6wxvLT3geq2K6mXQwm1NKWfGP7SDqw0a6fSyy
	 d0hh/zi51QMkA==
From: Mark Brown <broonie@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J . Wysocki" <rafael@kernel.org>, Jean Delvare <jdelvare@suse.com>, 
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240710015622.1960522-1-linux@roeck-us.net>
References: <20240710015622.1960522-1-linux@roeck-us.net>
Subject: Re: (subset) [RFC PATCH 0/3] regmap: Implement
 regmap_multi_reg_read()
Message-Id: <172065389381.390030.364634447127435335.b4-ty@kernel.org>
Date: Thu, 11 Jul 2024 00:24:53 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-0bd45

On Tue, 09 Jul 2024 18:56:19 -0700, Guenter Roeck wrote:
> regmap_multi_reg_read() is similar to regmap_bilk_read() but reads from
> an array of non-sequential registers. It is helpful if multiple non-
> sequential registers need to be read in a single operation which would
> otherwise have to be mutex protected.
> 
> The name of the new function was chosen to match the existing function
> regmap_multi_reg_write().
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-next

Thanks!

[1/3] regmap: Implement regmap_multi_reg_read()
      commit: 450a60ef607900bb9affb0e822fea9726679c512

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

