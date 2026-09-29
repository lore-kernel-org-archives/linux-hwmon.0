Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C17D529404;
	Tue, 29 Sep 2026 13:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790688207; cv=none; b=ghFA/z4BCknyS4jdjZcxrLXuwSbvuioBuWs74tlDn+OQWrunhQw94HjxNzmEwaLfHu4ilV/oTlNCs3+1QsTEdi2m05ZxQlPOvzxRs3MYQWyGJN5GgSYKh7iHyVPLiJWNlAdkXAoK81IEQ9NdsqC7RTwhsZ3o2oywTEDxVqENb5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790688207; c=relaxed/simple;
	bh=L6pBxtDxRflPfVWqSne8AS4+QODmrEra1/Eejrj9400=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tPR+WxdOhLGs4tayBAaLvyx+WopE1w2+87OPCzhMRrG15gMy8yFL+PGxlwUXluOrul7ZMrkGH+qZcjmASx9xgwXXmMDkydZXlW3aUYSY+vzjYobOXDa9dlc8uV/QwdP5QQGKLMdim6bYhTn4c6aN9C1r9CVMu3KJhzGWQYcECLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jG44HX6H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jG44HX6H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD7C31F000FF;
	Tue, 29 Sep 2026 13:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790688206;
	bh=L6pBxtDxRflPfVWqSne8AS4+QODmrEra1/Eejrj9400=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jG44HX6HHPeHghXgFDHJbxY15vPxZBmcL+0q6K7ogm6PzfE09/mHPyreSZsJazQnA
	 VToth8r07OSeju0mnT17Gk/07sRXa6Mw058hajLk7uGeSmVjfr5kBnyaNrC0U+pmHo
	 lqLbAcRbvT5bCMl2Un42Cw+ryRyfV0h6xl7qNz9wftIOw401OW/Qo5vhJulx08uhhL
	 pWK9yldpQqxN8kib6aTU7xi6u4Ouu4Ui8KzOjeoVqJCrDUbqAcW43AIwJP689ccPwg
	 3q8BE4spVSK68WiOgT0jRrCgLWOxKdvRMnrfP/HFfm1QZ6cJmMun2FYIIPBiUy73M/
	 MYLJspRsN0gmQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 05/12] arm64: dts: qcom: pm7550-eliza: Enable BCL
 sensor node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manaf Meethalavalappu Pallikunhi" <manaf.pallikunhi@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org, lee@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-5-f5ca00889cf7@oss.qualcomm.com>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
 <20260929-qcom-bcl-hwmon-v3-5-f5ca00889cf7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 13:23:25 +0000
Message-Id: <20260929132325.BD7C31F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add Battery Current Limiting (BCL) hardware monitor node for
> pm7550-eliza. The BCL monitors battery voltage and current, providing
> hardware interrupts when configurable thresholds are violated.
>=20
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qua=
lcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929-qcom-bcl-h=
wmon-v3-0-f5ca00889cf7@oss.qualcomm.com?part=3D5

