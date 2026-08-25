Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF963C3F4F
	for <linux-hwmon@vger.kernel.org>; Tue, 25 Aug 2026 09:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787650402; cv=none; b=fp0OjDokAmmbGBQS8itUKA3ujwxmfhvUP93Cg4KyNt401RJS8rlBicHJXNu24Fa3bUuedXX3/qCEryFGzgign+EWv3MjJDz/kHseIKhl/h34UJqy/r91pbnA2uFeKwbHhW+2//+aNlflGb61tyQLInL1Fy1ptkUAu/c4OKOTV+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787650402; c=relaxed/simple;
	bh=+1PSBPp4BXY0HrpLfGhGJSCtOEklxWqHYzJb96iTgy0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bOkhsfHWnoZMiFMPN1qnmtZ7w2BYRYhlSS1Ss4JBf1SaeTEQxhioEkrzctHAVmliDAlWpVrZDe1/0nRi/Sb9CILZYUJuTGBl0Zr/kUtMuGFzhsGjPRM1CZ77lgE/XRCUw27xbXnyhioTidqDJoNRTFsLyhGx4IhqMcJiXiSlgBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nmfT79Se; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nmfT79Se"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 533271F000E9;
	Tue, 25 Aug 2026 09:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787650401;
	bh=+1PSBPp4BXY0HrpLfGhGJSCtOEklxWqHYzJb96iTgy0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nmfT79SeVi3tEq8D9cjyios1gtLXZwSPz7vvrEB7LL/EiTVR9rZg8iSuwXAU/ySzy
	 AAqMrjafUPxVaME4tLIRNc6lnnoYThMEWKNoKfczem+Ob9c2wd16o2DZ7SSCYx1cDa
	 ZZmsVTF1t6gSgymv5OFbpHuM2TJDGDtkzXXu639CuMJX89wKZaXexCBHzlrnU5hika
	 Y/Vn6T46OIXfSFh/66bGk4OiqGbgq8oWU7EpexOsDnH4wINsF5SMPw3pq3l1QyGCmp
	 7TvATUTvF13sXCWMD4snKJeFrzuRNOshBCz71LDJ6/ZhpBaSIJnFc0NMzNcdqEQsCX
	 i//fWVs5KDAsw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/5] hwmon: (nct6683) Restore fan control mode on driver
 removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Johan Dahlin" <jdahlin@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260825092546.669450-5-jdahlin@gmail.com>
References: <20260825092546.669450-1-jdahlin@gmail.com>
 <20260825092546.669450-5-jdahlin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 09:33:20 +0000
Message-Id: <20260825093321.533271F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> A fan switched to manual mode stays there when the driver is unloaded,
> leaving it pinned at whatever pwm value was last written with nothing left
> to update it.
>=20
> Record the fan control mode register during probe and put it back with a
> devres action, so the EC resumes control of the fans the driver took over
> while anything the firmware had already set is left alone. The action is
> registered before the hwmon device, so it runs after the attributes are
> gone and cannot race with a pwm write, and it is a no-op if probe fails
> before the driver touches the register.
>=20
> Boards where the driver does not manage the register do not register it.
>=20
> Signed-off-by: Johan Dahlin <jdahlin@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825092546.6694=
50-1-jdahlin@gmail.com?part=3D4

