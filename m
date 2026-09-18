Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90D04D6C3C;
	Fri, 18 Sep 2026 10:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789728670; cv=none; b=B0Ol/nHkgwoDYEfDScdAw/bzlXBB7+yMKFnkmguvetiUQP1yGHjzXO1ODyUu4T35WtKBEA77YvqTPAGhrzKSmD1Ag8KXt0HeXuzRB1xUDG/rynxZ3qMNSkjGtBpd9RJKXm9oWrfAc5/y8RfrzPxrVaMhFEywtIyvlKQYFB3uA9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789728670; c=relaxed/simple;
	bh=hz4/3RM40eh1Zu8FABpJvj6DARgHPpxGN7y+G/1kDm0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Xej0lUJNFJqPriEmUqNn00YATvtsIYiomoptSUe48O/828XGH52LHLvGhX6IbxcQRyn4Q9ZA7pE4jRV73j00tMIfZYU2FW4sGbyI/1on9hR7fdCT11SOUH8GjZhNd1kppqfTDPAQShTTD6YINueDZ7JQ0+BD4YZ4HipA5w0ANug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f6YYLdHT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f6YYLdHT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 294C71F000FF;
	Fri, 18 Sep 2026 10:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789728669;
	bh=hz4/3RM40eh1Zu8FABpJvj6DARgHPpxGN7y+G/1kDm0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f6YYLdHT131t4ZQR1tYqniVubSdEL7ytc8PbJm7Iyx/opjol4ct4q6QeTDRy0QNZe
	 8Y4SQLCfdeICLXBQ5UfvPBENTvZGh9m//SEDp5tzWl+v3Z1/CAEapkIIpb6stlBSqR
	 +viEwMUEsy47RZfScg4fRqG3Enj8y1rznhxRe9f0XtHGwmvvb/iK30nRvUcyLm8abU
	 ekjq5bO4A98GYiDEjpOENaRC6UcYaIUH0kGhd2h9HV6NPOJ+loIoF/cxvSEYrEGwkn
	 CjkkWRh3pRmWXYhMYAOv5Hrvmu3Z1Gcqf40Ysri6J3NbAu9sbB56iqhC2jTuQnl9wP
	 RxVvMdQaQTCdA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/2] hwmon: (pmbus/tda38740) Add driver for Infineon
 TDA38740/TDA38725
Reply-To: sashiko-reviews@lists.linux.dev
To: "Colin Huang" <u8813345@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260918-add-tda38740-and-tda38725-v6-2-a8b11018d850@gmail.com>
References: <20260918-add-tda38740-and-tda38725-v6-0-a8b11018d850@gmail.com>
 <20260918-add-tda38740-and-tda38725-v6-2-a8b11018d850@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 10:51:08 +0000
Message-Id: <20260918105109.294C71F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add a PMBus driver for Infineon TDA38740 and TDA38725
> single-voltage synchronous buck regulators.
>=20
> Signed-off-by: Colin Huang <u8813345@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918-add-tda387=
40-and-tda38725-v6-0-a8b11018d850@gmail.com?part=3D2

