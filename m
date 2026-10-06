Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1B33F1ACE;
	Tue,  6 Oct 2026 14:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791297408; cv=none; b=LOnm72BoMrFUrYQHNaULAZcDNS9gmOI8Y86HTOsr9mEHB9wytjWGAaL6OyA3Sn7ERsX2j5HrAhvubJ+kmH5+p/TwteCKL+W2YkXWAD05xO5IJS0GFR27vRhQVNbm7/XU7gh1CG9tD3QPgKySnRMtav92JuhprSAG5dvrCQt/PKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791297408; c=relaxed/simple;
	bh=Du715d/GXvp0weHXce0cb9IcYUZ3N2wWS85/a0Xjye0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Oq4dVQCghvrMZDQ6wdu4VGNWFBEqKgs4B/xPppeaLeona9iiZm2av4yoItRWM4S2fWtwx6Wo2nZ0cKqOOBWgbJcz2mwKOUL2evEBD26UHd3NRea8AXBkcC/cJubSwg1Myyawfx5eh4mzhpWC2Q6Dn32Zwl9XFhgc0rHanWn3JK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tdhOSBIE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tdhOSBIE"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7A1C1C2BCF4;
	Tue,  6 Oct 2026 14:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791297408;
	bh=Du715d/GXvp0weHXce0cb9IcYUZ3N2wWS85/a0Xjye0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=tdhOSBIEIOWIeotNMQUs7EkqFrGkTjIyTXpjiZQEF791/RktVWdAFE1bGMwglS9KL
	 8LW2pRZFeoO69zC+R7KbQGMgAuOhg8XqI98KE7C6B/6kZGN2/GeqAKKCgt80Crthou
	 3iIBOWWlGrWhxctttcItwvPBX2ccSuM5sf7IlsGmtSpuUlb7l2kxJuT8E4pSvhNpfE
	 mpv9iTbqv8w+QteB4uCJpOoJ59dz93Wef8ainV/kCNk/jfzq0NhtvmQoGF7wgnpkQR
	 5eQfIWSnXtKwl6l8IqwsfVonb6R37M+mfbwgrRv0WgjYikIK2MRBnI5JUpF8yuoabH
	 rO+KaiAkw5VhA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 518FACA5FFC;
	Tue,  6 Oct 2026 14:36:48 +0000 (UTC)
From: Matt Layher via B4 Relay <devnull+mdlayher.gmail.com@kernel.org>
Subject: [PATCH v3] hwmon: (asus-ec-sensors) add CPU_Opt fan for ROG STRIX
 X570-E GAMING
Date: Tue, 06 Oct 2026 10:35:36 -0400
Message-Id: <20261006-asus-ec-x570e-cpu-opt-v3-0-62672edc18b3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNyw6CMBBFf4V07Zh2Cm1w5X8YF7UMUCOPtEAwh
 H+X4oaNcXmSe89ZWCDvKLBLsjBPkwuuazeQp4TZ2rQVgSs2ZshRCc5TMGEMQBbmTHMC24/Q9QM
 olAqFKbnOOdu+vafSzbv3dv9yGB9PskOUxUXtwtD59x6eRNz9a0wCBBQ5GamFlbzIrlVj3Otsu
 4bFxoRHi/plwc2i06JEaRFLnh4t67p+AFZl/QsSAQAA
X-Change-ID: 20261004-asus-ec-x570e-cpu-opt-623621af0790
To: Eugene Shalygin <eugene.shalygin@gmail.com>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Matt Layher <mdlayher@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791297407; l=1127;
 i=mdlayher@gmail.com; s=linuxdev; h=from:subject:message-id;
 bh=Du715d/GXvp0weHXce0cb9IcYUZ3N2wWS85/a0Xjye0=;
 b=2onDSZxHI3ZVFEXxDP3FKcJi9OA2AamFktHt7ILCv/AK84Ex0blmA3hte5x8cmrj4v0T6JvL5
 N7iei+Gj9MFBYTj97ZU6hNiJ0huRbTlrdERJr4UwqujMr+J5MU6XyId
X-Developer-Key: i=mdlayher@gmail.com; a=ed25519;
 pk=jO44g3WNw2T0EoKPeB+RUgDmyrZpA5Pmr830ITlwhaA=
X-Endpoint-Received: by B4 Relay for mdlayher@gmail.com/linuxdev with
 auth_id=1109
X-Original-From: Matt Layher <mdlayher@gmail.com>
Reply-To: mdlayher@gmail.com

Testing:
- Runtime: the same one-line change applied to the driver in v6.18.54,
  loaded on the board in place of the stock module; CPU_Opt read
  1454-1463 RPM and the chipset fan 0.
- Build: hwmon-next with W=1 and sparse (C=1), no warnings;
  checkpatch --strict reports no errors, warnings or checks.

Signed-off-by: Matt Layher <mdlayher@gmail.com>
---
Changes in v3:
- Drop the LLM usage note in favor of the Assisted-by tag (Eugene).
- Move the testing notes to a cover letter (Eugene).
- Link to v2: https://patch.msgid.link/20261006-asus-ec-x570e-cpu-opt-v2-1-74df23c22f04@gmail.com

Changes in v2:
- Shorten the commit message (Eugene).
- Link to v1: https://patch.msgid.link/20261004-asus-ec-x570e-cpu-opt-v1-1-d9ea371c30d5@gmail.com

---
Matt Layher (1):
      hwmon: (asus-ec-sensors) add CPU_Opt fan for ROG STRIX X570-E GAMING

 drivers/hwmon/asus-ec-sensors.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
---
base-commit: 4781ca52761e666cf18b591e6bb0478396c90320
change-id: 20261004-asus-ec-x570e-cpu-opt-623621af0790

Best regards,
--  
Matt Layher <mdlayher@gmail.com>


