Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C048490C1C
	for <linux-hwmon@vger.kernel.org>; Tue,  1 Sep 2026 18:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788286974; cv=none; b=Lt39Pvk4GkoiZgte/+VV2BSGWRm3zVGqjv47v5jntNYL67+Pbf0whuzuyermgUTzm7yp4hOBXQgklYrNYVLfmn1WHtFNHT4NDXukrmX7K/a1+PbjdAqVdDlEE947eRtHlI+mDNJTVFuZ5D8eQinRAC3rtStDwiWWXvsVBqAWSr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788286974; c=relaxed/simple;
	bh=MQNqu5dFstwvQvoELDzgJ4SmA9kaxBa71uexTRlCL70=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qkB3vMydosBboNZQwodANO7bhiN+JpHA7sEK8k5LUu1zldGb0k2VzMJrBD+pJQfE5782aDGP2Ti3kj/ubI02chC7N6qb0VPzIJi8EwIndhVGgcw41H92jlCjkqfshwq0Lk02rKmQBUy1alyyAc0hc7UNyKfr9P6U4OJALW4Emyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n7Al6uCS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n7Al6uCS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EADCE1F000E9;
	Tue,  1 Sep 2026 18:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788286973;
	bh=MQNqu5dFstwvQvoELDzgJ4SmA9kaxBa71uexTRlCL70=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n7Al6uCSbBDohjphc7HLUTEpyhE/aGnlbaOIfMDOpi9VtZ3t8I4TXd8Z5jSbfBpr2
	 WLqBoBwSV4gLd03FENWzYf0ZJC1ve2vi95R6Hc587KOqb5E+H3OEOVqoUfcQipjAnd
	 kf390ZirrrC7f48P7x673e7kZxdsCMMT7QcnHvKPzLfuTr4IlleMHJjdb5nEoJeVwm
	 p5KX0QfrhiRbijNJWlgLek8gELvSl1zANrgj910hy/y2axLpVJvc5w71FdZBNMH97d
	 3pGnaafEGw+pbtK6AHzlYqCSTrhCB41tq13OAwJ7O5ayaZ+6CZJPyTS4HruwcrV+R4
	 KNrEOYR1WFyqg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] hwmon: (dell-smm) Add Dell OptiPlex 7090 to fan
 control whitelist
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260901181849.241776-1-W_Armin@gmx.de>
References: <20260901181849.241776-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 18:22:52 +0000
Message-Id: <20260901182252.EADCE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> A user reported that the Dell OptiPlex 7090 needs to be whitelisted
> for the special SMM calls necessary for globally enabling/disabling
> BIOS fan control.
>=20
> Closes: https://github.com/Wer-Wolf/i8kutils/issues/18
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901181849.2417=
76-1-W_Armin@gmx.de?part=3D1

