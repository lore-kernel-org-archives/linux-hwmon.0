Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794617384;
	b=tXoVZnqL9bKE5AT74Hcph80relr/lp/T+TQw4Mv4Wswxi+L3IYeIsX+1SR+V2dULZytG
	 6pvinNWJTXQ/pCiGho5EClStmQc9rmZ6RVVfV4HaXDW8//fo2z6WDearxkY2FU9uPnEn9
	 AdoxGp7FcaYAcwPz9UYbS3UqfPnFlUZkeeB3+Q9PUrGb4CTGsAWzKvT+7/Hms6xjwnBRq
	 vkBiPswIwKyIAGe3br3G5mTdP0udUkc62VAhIcBsPK9IaPXSQssfsjtLWg9AG7i9SuOYk
	 BKbfYO+79igJA5gy98U/PDr5Os8h35SkbQO7ZOOKHsMCZX//IKHIzySU0tBQ2PZIWYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794617384;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=62Ih2Y/07M8ZQccvxQBhH6Td5Mj+dyw8y78BKxAQh8I=;
	b=fFF9oxk6RAK5V7ySnKoFu5G6lwOlYOE1D/0XxMfr7+1jG6PQncnJrIGIqQ7dSwvVOTp0
	 34v8PXeSLTnG6L7Yu9ZYiKXZdTtll8CJGQiGnKf1oN8uyP0BfSqbijGYJXfKarfhe/mhn
	 TpCYeeJLwQcKXrOarcmjQAp1StHOoOU3QJL/GYMDH61kQaR+YCpHleNIO2nTDe6QqbBnK
	 wEQXCAHU4jEHRenZKmjBhohz00B/79kkpopc7NhPO4o4uUAZrYJyoo6sADHjSE62k4NPV
	 4v1hX1abwg/KmOO+S3ELmDuBy9VwpytYYquciEZILVORYC3aRve/5iR9ULoxz1q4S/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dr1r3mlc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA19606A333
	for <linux-hwmon@vger.kernel.org>; Sat, 14 Nov 2026 00:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dr1r3mlc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C3CA1F000C4;
	Sat, 14 Nov 2026 00:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794617384;
	bh=62Ih2Y/07M8ZQccvxQBhH6Td5Mj+dyw8y78BKxAQh8I=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=Dr1r3mlcFDzuqhK49g3S856ytlZExyWdTPYdCV2krh/v9WbElt0ynvgp9b0bBmaXW
	 Bu7ubZBB5RCrv5znusgVQr8cMnpWzno9UKvCEIrerCDk0oM/+rbGyhgUGrhKsFrI8+
	 8f6t27Aq71CtSRqsoTn3lCF0B8nI1dWmwSb2RPc2Vad9SkAzrona/bOkA7TdOMoQrQ
	 pkt1MP030etgtc2Rt3yxwmljBunT63/Gysuo4eoP97hCEB199V4/AA5rGUnaE4w3EP
	 pO10bbgJtY/zzAB1CVWMY6bSqmuRj962y8O4eNm0wFK/cpe1NIyeQgG1N/QgEDJxbj
	 ipKcbuIZ1KSYg==
Message-ID: <sashiko-outbox-213954@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: hwmon: adt7475: Add
 #thermal-sensor-cells
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?RGF2w63DsCBTdGVpbm4gR2VpcnNzb24=?= <david@dsg.is>, linux-hwmon@vger.kernel.org
In-Reply-To: <20261114004110.328050-2-david@dsg.is>
References: <20261114004110.328050-1-david@dsg.is>
 <20261114004110.328050-2-david@dsg.is>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 00:49:42 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The ADT7473, ADT7475, ADT7476 and ADT7490 measure two remote
> temperatures and their own. Add the "#thermal-sensor-cells" property so
> that thermal zones can use these as sensors. Its single cell selects the
> temperature channel: 0 for Remote 1, 1 for Local and 2 for Remote 2.
>=20
> Signed-off-by: Dav=C3=AD=C3=B0 Steinn Geirsson <david@dsg.is>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114004110.3280=
50-1-david@dsg.is?part=3D1

