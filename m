Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FCC1D0E35
	for <linux-hwmon@vger.kernel.org>; Fri, 11 Oct 2024 20:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728677200; cv=none; b=jac2v+rvSfyrVHFY9uyWxr7FNsIrlDTjtpXtajynMYeDX4nGMnJE9Qm5CfwaBZdPgsKiG20LD2or9WBnorm65Ntq7q1PbcRGelZFg38j09n5nN7HsoFNYlTiJ13jTPWkk618o0iQ06P/yczqDLP408SPRH4AFPc17EXewfb13ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728677200; c=relaxed/simple;
	bh=y3MXAVrv8N5qCZTrgRLa8pwueb/x/eHb93pnqKb3MV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jeWqmbDEco8Z/5pEiZKrp2vOdnDwQATdAo4dXuuzXnBruj9bjLlWCZ/6jl2TvVkI6K+KLytHlpeB32A/nYS1GYOPc6XaNpbbyCnvlqZUoxMTTkyM2vnREWHOL91pLktt/LOvDTkMDMtwgY7WIjkGqC+J1dF9tnOuRLqylZa1wuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=ZtYgSuTs; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="ZtYgSuTs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1728677184;
	bh=y3MXAVrv8N5qCZTrgRLa8pwueb/x/eHb93pnqKb3MV8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZtYgSuTs9AM0LxwoPx6E1nh7Zynmq2CUq/KmUNLwRirH87WLbisZ38NXF+qYCVbWN
	 byaFexjlstyl+umhihYiMyVHNsvMa+0x+Otfg8AEupdO3HVE5elIJohODvcH97iikv
	 lSvYfF8JWTE1TNaLvL5Nqe42COpFlEOigx9QoPV4=
Date: Fri, 11 Oct 2024 22:06:23 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 5/8] hwmon: powerz: Simplify specifying static visibility
 attribute
Message-ID: <8ba816cc-81ef-454e-a0b6-ee1f5379a681@t-8ch.de>
References: <6f43a3e1-3622-4595-a1ec-2b3ad94bdf5b@gmail.com>
 <c4b4568b-59f6-43ac-8281-536a82ecd6ab@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c4b4568b-59f6-43ac-8281-536a82ecd6ab@gmail.com>

On 2024-10-11 22:00:49+0200, Heiner Kallweit wrote:
> Use new member visible of struct hwmon_ops to simplify specifying
> the static attribute visibility.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Acked-by: Thomas Weißschuh <linux@weissschuh.net>

Thanks!
