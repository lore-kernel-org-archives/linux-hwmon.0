Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560FE42D774;
	Thu, 30 Jul 2026 13:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785419213; cv=none; b=FmMtbdtYWiqE/5I6qFsbOeGSIGQeCgdUG+1T2RZJtwEXa+VuR9j/8PxRFYxGYNnLLFLV1DsUw5PDdGU6fAMzk0xKUSJjqvoAXJvEHzRwEpLu0zFFTWcajLwY4RtmlRmTXiS0rlcrO/j4XFelcBq0p7fQkY9SClF9+3diVIi5nNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785419213; c=relaxed/simple;
	bh=34w/C8FGOTBCbbm0DXzVswLyI6iRjxvGtswKTlNriFU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NBRtbCK8WRYWi+qgOgrDe8h0pRZ3EQX9eanxyxBIJyrn/sHB2NXboSRBUpboz4cPgqLexO0v9zdux/Mrhn432NZcVFmi+KOzIXWJMYZzHDWjta7JLeCsNhEtJK9eDBFAebEr7oe3/09boQOVHKhV8osQu5H4FcF+wkvUH8KhVSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XnPTsdVJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XnPTsdVJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2B6B1F000E9;
	Thu, 30 Jul 2026 13:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785419212;
	bh=34w/C8FGOTBCbbm0DXzVswLyI6iRjxvGtswKTlNriFU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XnPTsdVJqs2ZnwU4HndJmOzmtsEeiv0QEWHTmoDSzuF0Yw4V/xrGBTZvjmZa3+29J
	 qqTojEDlpzzV3GaPxL8rikfwp54MPbxxldbhSqW3YggqWAIF0Q6Dieund7inMM7IIM
	 9ebJBMAJej7WYK5UoC6/rMdwPeEKfj02ZVs7mBGljmGgCN6uUDWc7zbQG3zkZqDTOB
	 1Ys1TcyLWzpsS27aLP6kxoZfzLtTqmqHzVjyAoAXTSlD1y52A8zp0EkAFgf/NO+pmb
	 0mQr6zZMndCyRNNM59o4sy/OuvvpKd8DLEXpaHftcZTsROO68rDG6PgnidKcdPfxJx
	 mF9kVn8rgX60A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] hwmon: (tmp401) add channel label support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bruno Thomsen" <bruno.thomsen@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260730133058.14731-2-bruno.thomsen@gmail.com>
References: <20260730133058.14731-1-bruno.thomsen@gmail.com>
 <20260730133058.14731-2-bruno.thomsen@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 13:46:51 +0000
Message-Id: <20260730134651.A2B6B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Allow userspace application to select temperature sensor based on
> channel label in device tree, just like it's possible in lm90.
>=20
> Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730133058.1473=
1-1-bruno.thomsen@gmail.com?part=3D2

