Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABFF55821F
	for <linux-hwmon@vger.kernel.org>; Thu, 15 Oct 2026 17:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792084971; cv=none; b=mVqdxzQpRjVU/jT9lNrQEmcJiKPeBkqAWlNfuw8VRjCRraBvrPqhrwkjvBlP4on0F5wh/Xg538QmNriOzJltWre9rhjl7K+p1YXSZPXkJ6gtHU8P51Dp/MeB4w7uQkyqKYNeUlw3ohxl1Rtnxbr34+kHsQA+vScp3KubtLsiyoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792084971; c=relaxed/simple;
	bh=Pyqv9+QrCx3SJc+0Gidx8ch+ejFIQXZpt3TyCoxl9Vg=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date; b=AjfxbcHFqHdExoO9fuRvEH3PA6qS7N1ycHXFeJfLPn3Tq12LL8jsrHhXEwp4WlsWfpBqTDDbA0PY+xgrqZ8Oqe3SFvVBpGWelkUDWEqOHuH3WadB5kc9Uu4Q5+PXsBk/7pO+r+56LRtXn+rjCJmYIOqTMq2t3ZReHRtbqkzDrrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V61zFoq2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V61zFoq2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 189E71F000C4;
	Thu, 15 Oct 2026 17:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792084961;
	bh=Pyqv9+QrCx3SJc+0Gidx8ch+ejFIQXZpt3TyCoxl9Vg=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=V61zFoq2D6JldN27A3F/YELior+LyxztlKou2RH+qpKJIHAy0TUiL3qnNI/cs+V5r
	 FXZTAEIJsTPXJiw5fX80U880Wqj+ShgH/W54yNZ60YKeg4BPtBCs8a2W0qCfXGa+mz
	 QyeSoPv/efbxgaZvkpWZEwQfdWA/CG4Uxnn+buVphGiyE4n+C5jNisN6u9vVpb16zz
	 RFrw5oymdiAUxEfsVwvQoLw8ksIJW21zMvqM61mn2evh7vtBY6IUssBcUi3IIeD1EH
	 ey+wsurU6/eXoP/maYipELAOBXfUBp1NEqx36BwcRcN89M+/CbqwbGToUFzbz+1XYF
	 2m+Z9KmrjgpKA==
Message-ID: <sashiko-outbox-173250@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (coretemp) Document sysfs numbering and label
 meaning
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QXNhZiBOdXJpIEJlcnRpemxpb8SfbHU=?= <ycistak@gmail.com>, linux-hwmon@vger.kernel.org
In-Reply-To: <20261015171759.704526-1-ycistak@gmail.com>
References: <20261015171759.704526-1-ycistak@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 17:22:40 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The documentation says that all sysfs entries are named with their
> core_id, and that the "Core X" label contains the processor number.
> Neither is accurate. create_core_attrs() numbers the per-core
> attributes core_id + 2 and always uses temp1 for the package sensor,
> and show_label() prints topology_core_id(), not the logical CPU
> number.
>=20
> The difference is easy to see on hybrid CPUs. On an i7-14700F, the
> "Core 4" label is on temp6 and belongs to CPUs 2 and 3, and the
> E-cores report core IDs 32 to 43.
>=20
> Describe the actual numbering.
>=20
> The mismatch was found by an LLM comparing the documentation with the
> code, and verified on the i7-14700F above.
>=20
> Assisted-by: LLM
> Signed-off-by: Asaf Nuri Bertizlio=C4=9Flu <ycistak@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015171759.7045=
26-1-ycistak@gmail.com?part=3D1

