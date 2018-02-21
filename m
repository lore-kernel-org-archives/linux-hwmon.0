Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from hqemgate14.nvidia.com ([216.228.121.143]:16219 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751416AbeBUG7a (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 21 Feb 2018 01:59:30 -0500
From: Rajkumar Rampelli <rrajk@nvidia.com>
To: <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <jdelvare@suse.com>, <linux@roeck-us.net>, <corbet@lwn.net>,
        <catalin.marinas@arm.com>, <will.deacon@arm.com>,
        <kstewart@linuxfoundation.org>, <gregkh@linuxfoundation.org>,
        <pombredanne@nexb.com>, <mmaddireddy@nvidia.com>,
        <mperttunen@nvidia.com>, <arnd@arndb.de>,
        <gregory.clement@free-electrons.com>, <timur@codeaurora.org>,
        <andy.gross@linaro.org>, <xuwei5@hisilicon.com>,
        <elder@linaro.org>, <heiko@sntech.de>, <krzk@kernel.org>,
        <ard.biesheuvel@linaro.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-pwm@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-hwmon@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <ldewangan@nvidia.com>,
        <rrajk@nvidia.com>
Subject: [PATCH 01/10] pwm: core: Add support for PWM HW driver with pwm capture only
Date: Wed, 21 Feb 2018 12:28:50 +0530
Message-ID: <1519196339-9377-2-git-send-email-rrajk@nvidia.com>
In-Reply-To: <1519196339-9377-1-git-send-email-rrajk@nvidia.com>
References: <1519196339-9377-1-git-send-email-rrajk@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Add support for pwm HW driver which has only capture functionality.
This helps to implement the PWM based Tachometer driver which reads
the PWM output signals from electronic fans.

PWM Tachometer captures the period and duty cycle of the PWM signal

Signed-off-by: Rajkumar Rampelli <rrajk@nvidia.com>
---
 drivers/pwm/core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
index 1581f6a..87d14c9 100644
--- a/drivers/pwm/core.c
+++ b/drivers/pwm/core.c
@@ -246,6 +246,10 @@ static bool pwm_ops_check(const struct pwm_ops *ops)
 	if (ops->apply)
 		return true;
 
+	/* driver supports capture operation */
+	if (ops->capture)
+		return true;
+
 	return false;
 }
 
-- 
2.1.4

