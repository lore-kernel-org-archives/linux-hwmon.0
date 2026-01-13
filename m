Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7669738B7C5;
	Tue, 13 Jan 2026 13:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768309467; cv=none; b=P1g4F97hdY2vDzRw6cHIZEt2xOjtgvbvjaSAzelCxBwMi1aRdfCPc30LemX4Zw4RcSIsMfQu0oH8I4r19ZUMzNIIKADUeFfDw44ozjjmfmYJvMPY2iN+6AU6C8Q1Ss8OcapyD33DQ8VIxpWBk3uQsXpXttN0ChZD0aegctOVF2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768309467; c=relaxed/simple;
	bh=FF7eRDNfJ5J+APdgHMEkJXsDZSXXuomOQ67NlMpAa0k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fgVnl/YtZFSuoxqtvPmLfhoy7ws2xWCUfG6ja16e24hh71gb4YMUhVcruHsKkb4LOZFTDF6mGCmytWarGSQ2/Z/vS6BOinqo0QYkGd6HqdaC/zzZQe8Po9nfNnB4rgiuMzMoaDuGdIYtCqBH2KYYlAwt6Bpal5OUtFnEZYBldkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YPxCBnoE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YPxCBnoE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14298C116C6;
	Tue, 13 Jan 2026 13:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768309467;
	bh=FF7eRDNfJ5J+APdgHMEkJXsDZSXXuomOQ67NlMpAa0k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YPxCBnoE+SyxZDEeynxsXS4Z1S6VzL/6DmOq4I7m8PsEMjk6HKKE4kfrtLDhdIDw+
	 NJrX4xeSwiG1JqxWFygfE0J5WJXwoBQWPL58YWQoUhGCF0VZHHH8hu2M3kX99qjCYq
	 DCARABK9Vy/aw5cAzfeO/1pmL7vDtMyG0t3VBrs4YP2kFxPpg6oMhe28G9HPf0s4kx
	 OeI4BSv0IHK1B9/uNgZDhJIqph6f09NJVw6WKXcDOfIV2Vl4teMzVQbmbwTmI5mC25
	 n0GAVpG7T98+Kt+KReBfGlneV9u+88LjvJ5WB/ItYKn46i7Y/v/vmtqhwkF/NRyipB
	 bNZPZQbgHu1VA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Andreas Kemnade <andreas@kemnade.info>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Josua Mayer <josua.mayer@jm0.eu>
In-Reply-To: <20260102-tps65185-submit-v3-0-23bda35772f2@kemnade.info>
References: <20260102-tps65185-submit-v3-0-23bda35772f2@kemnade.info>
Subject: Re: [PATCH v3 0/2] regulator: Add TPS65185
Message-Id: <176830946479.57532.9044166740752095483.b4-ty@kernel.org>
Date: Tue, 13 Jan 2026 13:04:24 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Fri, 02 Jan 2026 11:13:55 +0100, Andreas Kemnade wrote:
> Add a driver for the TPS65185 regulator which provides the
> comparatively high voltages needed for electronic paper displays.
> 
> Datasheet for the TPS65185 is at https://www.ti.com/lit/gpn/tps65185
> 
> To simplify things, include the hwmon part directly which is only
> one temperature sensor and there are no other functions besides regulators
> in this chip.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/2] regulator: dt-bindings: Document TI TPS65185
      commit: da1456e435ae84852bda484cd4d60f47228d52fc
[2/2] regulator: Add TPS65185 driver
      commit: b0fc1e7701940d12ea2c41f386aa552bc4cc3629

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

