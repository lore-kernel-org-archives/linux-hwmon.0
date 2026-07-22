Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D32231326A
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Jul 2026 22:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784758682; cv=none; b=pgguSSyNgWdt3RuDeU2Qx5KCmAQq+JmxsWQM0wBlJBKtuDYDEZW23YSVd7c+v17brDX1wHNe6dsrm0DhlPoV+biaZV/ifyUdYaCLFyKUMRZmRGU7kxRGWMUWsQ1L0bjh/xwBa5NmRLfaqX1vWDPae/AfPNGFwAhcyKGN3MGMwRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784758682; c=relaxed/simple;
	bh=JYg73apR06bsbd5rPTr+GNHC8P4TGgp1IyGzXYuoDKM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TDOxOxAosXGcvl3VwFgXL71tbTLy6FmHpDR/oRlS0muu/YJh/FCf7vFo6GGPsXcJkTIS9VNfzjypXcvQKTtnvKsjLEuJ9B5UGzQ/Wpa9ep8GZpX3fvlyQjrpj/5mWIGs3Pd2dBCkNGuBWybQJlpwOw9gkZJS0LAZaIkVre6Cjws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R/YHwp9a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R/YHwp9a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A4011F000E9;
	Wed, 22 Jul 2026 22:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784758681;
	bh=JYg73apR06bsbd5rPTr+GNHC8P4TGgp1IyGzXYuoDKM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R/YHwp9aPPc0Ks114bl64fAd+k2s5x3IUKzdVHEpOXhLagj+sOOjAdEsTHurg+njc
	 Eb+HUYmbmSjbmOeuzII9eFxYVjslIKPgyOwlkbgiRgI/jYVlvP8iMiJ5xkCCHigy0q
	 HZDT9OPLchGLoNkxLSCxw+uavRwuqINjMk5XcUUmIeoz9kQD4TOhwN55fLhRcry0+o
	 bhFCUNPrA1sbKYNNf3wIiZySlu3XtW0fDPHecypnZqXd9U99kjoF872lWZZ7nEV/x1
	 h39J5U1b1nIaZYt1Iy1XLcGyi4COre1JZI8poofkI3OsDkgSCsUjC8FuSZkyPqka19
	 mBn7cpBlMa1Cg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 4/6] eth: fbnic: report temperature and voltage
 thresholds via hwmon
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zinc Lim" <limzhineng2@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260721221540.648272-5-limzhineng2@gmail.com>
References: <20260721221540.648272-1-limzhineng2@gmail.com>
 <20260721221540.648272-5-limzhineng2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 22:18:00 +0000
Message-Id: <20260722221801.2A4011F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The firmware capability response carries per-board temperature
> (min/max/crit) and voltage (min/max) thresholds. Parse and store them in
> fbnic_fw_cap, and expose them through the hwmon interface as
> temp1_{min,max,crit} and in0_{min,max}.
>=20
> The thresholds are always exposed. Values the firmware did not report are
> stored as the FBNIC_SENSOR_NO_DATA sentinel in the capability response
> parser, and a read of such an attribute returns -ENODATA.
>=20
> Signed-off-by: Zinc Lim <limzhineng2@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721221540.6482=
72-1-limzhineng2@gmail.com?part=3D4

