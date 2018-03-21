Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from hqemgate16.nvidia.com ([216.228.121.65]:12169 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751531AbeCUEkv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 21 Mar 2018 00:40:51 -0400
From: Rajkumar Rampelli <rrajk@nvidia.com>
To: <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <jdelvare@suse.com>, <linux@roeck-us.net>, <corbet@lwn.net>,
        <catalin.marinas@arm.com>, <will.deacon@arm.com>,
        <kstewart@linuxfoundation.org>, <gregkh@linuxfoundation.org>,
        <pombredanne@nexb.com>, <mmaddireddy@nvidia.com>,
        <mperttunen@nvidia.com>, <arnd@arndb.de>, <timur@codeaurora.org>,
        <andy.gross@linaro.org>, <xuwei5@hisilicon.com>,
        <elder@linaro.org>, <heiko@sntech.de>, <krzk@kernel.org>,
        <ard.biesheuvel@linaro.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-pwm@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-hwmon@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <ldewangan@nvidia.com>,
        <rrajk@nvidia.com>
Subject: [PATCH V2 1/9] pwm: core: Add support for PWM HW driver with pwm capture only
Date: Wed, 21 Mar 2018 10:10:36 +0530
Message-ID: <1521607244-29734-2-git-send-email-rrajk@nvidia.com>
In-Reply-To: <1521607244-29734-1-git-send-email-rrajk@nvidia.com>
References: <1521607244-29734-1-git-send-email-rrajk@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Add support for pwm HW driver which has only capture functionality.
This helps to implement the PWM based Tachometer driver which reads
the PWM output signals from electronic fans.

PWM Tachometer captures the period and duty cycle of the PWM signal

Add conditional checks for callabacks enable(), disable(), config()
to check if they are supported by the client driver or not. Skip these
callbacks if they are not supported.

Signed-off-by: Rajkumar Rampelli <rrajk@nvidia.com>
---

V2: Added if conditional checks for pwm callbacks since drivers may
    implements only pwm capture functionality.

 drivers/pwm/core.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
index 1581f6a..f70fe68 100644
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
 
@@ -495,7 +499,8 @@ int pwm_apply_state(struct pwm_device *pwm, struct pwm_state *state)
 			 * ->apply().
 			 */
 			if (pwm->state.enabled) {
-				pwm->chip->ops->disable(pwm->chip, pwm);
+				if (pwm->chip->ops->disable)
+					pwm->chip->ops->disable(pwm->chip, pwm);
 				pwm->state.enabled = false;
 			}
 
@@ -509,22 +514,26 @@ int pwm_apply_state(struct pwm_device *pwm, struct pwm_state *state)
 
 		if (state->period != pwm->state.period ||
 		    state->duty_cycle != pwm->state.duty_cycle) {
-			err = pwm->chip->ops->config(pwm->chip, pwm,
+			if (pwm->chip->ops->config) {
+				err = pwm->chip->ops->config(pwm->chip, pwm,
 						     state->duty_cycle,
 						     state->period);
-			if (err)
-				return err;
+				if (err)
+					return err;
+			}
 
 			pwm->state.duty_cycle = state->duty_cycle;
 			pwm->state.period = state->period;
 		}
 
 		if (state->enabled != pwm->state.enabled) {
-			if (state->enabled) {
+			if (state->enabled && pwm->chip->ops->enable) {
 				err = pwm->chip->ops->enable(pwm->chip, pwm);
 				if (err)
 					return err;
-			} else {
+			}
+
+			if (!state->enabled && pwm->chip->ops->disable) {
 				pwm->chip->ops->disable(pwm->chip, pwm);
 			}
 
-- 
2.1.4

