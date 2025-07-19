Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F622126BF7
	for <linux-hwmon@vger.kernel.org>; Sat, 19 Jul 2025 18:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752949071; cv=none; b=ojVFXPPuTpu5KbLAxkM/c1cdBQbUEQEhnafR/dJbeESUjqxlh1A3jjX4A3R5zZBlaP02dcOUzbqiSie7Cl2SZlcLtdoz7FXnkgVLKDLGcXHbDCcHFokpDB8ZiPsjzXASI1H2P80guiMjnyTh7Mw/TByNPKBMRYt90ilTeZZkzcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752949071; c=relaxed/simple;
	bh=3AVQkn861gOBExfJA09IKhRaBST2WQalZZQbHo8TIf8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sAxZWCGkKznONodzHjAouWhDh9VtFCkH8nqOdsRZOEQj2LWl2X8Ls/9kPGppw08pToaxcqoGgZDo4ivMnBuhczs39F+QB3NA+Eam5gnZVsTZKteGMNkh1wNPWb6CC4Hy/qOrnBdAXlI5KJ6V+DcpXLtUG+0Wg+mjbn8ucwRswXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jNGWUDdr; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jNGWUDdr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752949069; x=1784485069;
  h=date:from:to:cc:subject:message-id;
  bh=3AVQkn861gOBExfJA09IKhRaBST2WQalZZQbHo8TIf8=;
  b=jNGWUDdro/Y+yw1905N9ed7DDXrqdfrbHCWcMKEcEhlCElMuqOMfThKu
   oCUZprL10dCQlFQK2GvLI0QwUKb2LImnPhJbgymEHm2ozYveDO2e+Zc6l
   8V/7+yaY3+VzVixcL7WmtRMpZL34d/E4k1Q71v8hqVvJkplqtfoKH6qOQ
   ZqJvXKCXVSZjMQTKB2BHqEY3EUnMbaJyB4IjuuJpUPTmCRsz49ULeT8sX
   EXTBQZXXQHS1C0hE3IvBOCcOXVm1VBgZsI8NqunvqVkbVVWgeht5h4bl5
   l6hjIMLYjBQc3uzZN7cC5K3IgGMzNAKfjQ8gOI1i+XcQ61N9mlsnJ0uun
   A==;
X-CSE-ConnectionGUID: 6aMdI3b6RlW/5tWGyQoREw==
X-CSE-MsgGUID: NkaBEe4cSN6PyqTbCTmHDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11497"; a="65907325"
X-IronPort-AV: E=Sophos;i="6.16,324,1744095600"; 
   d="scan'208";a="65907325"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2025 11:17:49 -0700
X-CSE-ConnectionGUID: btOnkDUJQBKVDujtVSMjIQ==
X-CSE-MsgGUID: miFkqvZrRUy8kfc9dL0cjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,324,1744095600"; 
   d="scan'208";a="189431643"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 19 Jul 2025 11:17:47 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udC81-000Fhd-1j;
	Sat, 19 Jul 2025 18:17:45 +0000
Date: Sun, 20 Jul 2025 02:17:23 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD REGRESSION
 3bea98137ca67f6a4458853f7065aa8cf44cacaf
Message-ID: <202507200200.gb9tdmeL-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 3bea98137ca67f6a4458853f7065aa8cf44cacaf  hwmon: (cros_ec) register fans into thermal framework cooling devices

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202507190650.w6es81CY-lkp@intel.com

    drivers/hwmon/cros_ec_hwmon.c:217:24: error: 'EC_AUTO_FAN_CONTROL_CMD_SET' undeclared (first use in this function); did you mean 'EC_CHARGE_CONTROL_CMD_SET'?
    drivers/hwmon/cros_ec_hwmon.c:223:24: error: 'EC_AUTO_FAN_CONTROL_CMD_SET' undeclared (first use in this function); did you mean 'EC_CHARGE_CONTROL_CMD_SET'?
    drivers/hwmon/cros_ec_hwmon.c:387:1: warning: control reaches end of non-void function [-Wreturn-type]
    drivers/hwmon/cros_ec_hwmon.c:429:1: warning: control reaches end of non-void function [-Wreturn-type]
    drivers/hwmon/cros_ec_hwmon.c:49:16: error: variable 'req' has initializer but incomplete type
    drivers/hwmon/cros_ec_hwmon.c:49:43: error: storage size of 'req' isn't known
    drivers/hwmon/cros_ec_hwmon.c:49:43: warning: unused variable 'req' [-Wunused-variable]
    drivers/hwmon/cros_ec_hwmon.c:50:18: error: 'struct ec_params_pwm_get_fan_duty' has no member named 'fan_idx'
    drivers/hwmon/cros_ec_hwmon.c:50:28: warning: excess elements in struct initializer
    drivers/hwmon/cros_ec_hwmon.c:52:45: error: storage size of 'resp' isn't known
    drivers/hwmon/cros_ec_hwmon.c:52:45: warning: unused variable 'resp' [-Wunused-variable]
    drivers/hwmon/cros_ec_hwmon.c:55:16: error: variable 'req' has initializer but incomplete type
    drivers/hwmon/cros_ec_hwmon.c:55:43: error: storage size of 'req' isn't known
    drivers/hwmon/cros_ec_hwmon.c:55:43: warning: unused variable 'req' [-Wunused-variable]
    drivers/hwmon/cros_ec_hwmon.c:56:18: error: 'struct ec_params_pwm_get_fan_duty' has no member named 'fan_idx'
    drivers/hwmon/cros_ec_hwmon.c:56:27: error: 'EC_CMD_PWM_GET_FAN_DUTY' undeclared (first use in this function); did you mean 'EC_CMD_PWM_SET_FAN_DUTY'?
    drivers/hwmon/cros_ec_hwmon.c:56:28: warning: excess elements in struct initializer
    drivers/hwmon/cros_ec_hwmon.c:58:45: error: storage size of 'resp' isn't known
    drivers/hwmon/cros_ec_hwmon.c:58:45: warning: unused variable 'resp' [-Wunused-variable]
    drivers/hwmon/cros_ec_hwmon.c:60:19: error: operand of type 'void' where arithmetic or pointer type is required
    drivers/hwmon/cros_ec_hwmon.c:62:27: error: 'EC_CMD_PWM_GET_FAN_DUTY' undeclared (first use in this function); did you mean 'EC_CMD_PWM_SET_FAN_DUTY'?
    drivers/hwmon/cros_ec_hwmon.c:66:19: error: operand of type 'void' where arithmetic or pointer type is required
    drivers/hwmon/cros_ec_hwmon.c:68:18: error: 'struct ec_params_auto_fan_ctrl_v2' has no member named 'cmd'
    drivers/hwmon/cros_ec_hwmon.c:68:24: error: 'EC_AUTO_FAN_CONTROL_CMD_GET' undeclared (first use in this function); did you mean 'EC_CHARGE_CONTROL_CMD_GET'?
    drivers/hwmon/cros_ec_hwmon.c:69:18: error: 'struct ec_params_auto_fan_ctrl_v2' has no member named 'fan_idx'
    drivers/hwmon/cros_ec_hwmon.c:74:18: error: 'struct ec_params_auto_fan_ctrl_v2' has no member named 'cmd'
    drivers/hwmon/cros_ec_hwmon.c:74:24: error: 'EC_AUTO_FAN_CONTROL_CMD_GET' undeclared (first use in this function); did you mean 'EC_CHARGE_CONTROL_CMD_GET'?
    drivers/hwmon/cros_ec_hwmon.c:75:18: error: 'struct ec_params_auto_fan_ctrl_v2' has no member named 'fan_idx'

Error/Warning ids grouped by kconfigs:

recent_errors
|-- alpha-allyesconfig
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:EC_AUTO_FAN_CONTROL_CMD_GET-undeclared-(first-use-in-this-function)
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:EC_AUTO_FAN_CONTROL_CMD_SET-undeclared-(first-use-in-this-function)
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:EC_CMD_PWM_GET_FAN_DUTY-undeclared-(first-use-in-this-function)
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:storage-size-of-req-isn-t-known
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:storage-size-of-resp-isn-t-known
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:struct-ec_params_auto_fan_ctrl_v2-has-no-member-named-cmd
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:struct-ec_params_auto_fan_ctrl_v2-has-no-member-named-fan_idx
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:struct-ec_params_pwm_get_fan_duty-has-no-member-named-fan_idx
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:variable-req-has-initializer-but-incomplete-type
|   |-- drivers-hwmon-cros_ec_hwmon.c:warning:excess-elements-in-struct-initializer
|   |-- drivers-hwmon-cros_ec_hwmon.c:warning:unused-variable-req
|   `-- drivers-hwmon-cros_ec_hwmon.c:warning:unused-variable-resp
|-- arc-allmodconfig
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:EC_AUTO_FAN_CONTROL_CMD_GET-undeclared-(first-use-in-this-function)
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:EC_AUTO_FAN_CONTROL_CMD_SET-undeclared-(first-use-in-this-function)
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:EC_CMD_PWM_GET_FAN_DUTY-undeclared-(first-use-in-this-function)
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:storage-size-of-req-isn-t-known
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:storage-size-of-resp-isn-t-known
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:struct-ec_params_auto_fan_ctrl_v2-has-no-member-named-cmd
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:struct-ec_params_auto_fan_ctrl_v2-has-no-member-named-fan_idx
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:struct-ec_params_pwm_get_fan_duty-has-no-member-named-fan_idx
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:variable-req-has-initializer-but-incomplete-type
|   |-- drivers-hwmon-cros_ec_hwmon.c:warning:excess-elements-in-struct-initializer
|   |-- drivers-hwmon-cros_ec_hwmon.c:warning:unused-variable-req
|   `-- drivers-hwmon-cros_ec_hwmon.c:warning:unused-variable-resp
|-- arc-allyesconfig
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:EC_AUTO_FAN_CONTROL_CMD_GET-undeclared-(first-use-in-this-function)
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:EC_AUTO_FAN_CONTROL_CMD_SET-undeclared-(first-use-in-this-function)
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:EC_CMD_PWM_GET_FAN_DUTY-undeclared-(first-use-in-this-function)
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:storage-size-of-req-isn-t-known
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:storage-size-of-resp-isn-t-known
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:struct-ec_params_auto_fan_ctrl_v2-has-no-member-named-cmd
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:struct-ec_params_auto_fan_ctrl_v2-has-no-member-named-fan_idx
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:struct-ec_params_pwm_get_fan_duty-has-no-member-named-fan_idx
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:variable-req-has-initializer-but-incomplete-type
|   |-- drivers-hwmon-cros_ec_hwmon.c:warning:excess-elements-in-struct-initializer
|   |-- drivers-hwmon-cros_ec_hwmon.c:warning:unused-variable-req
|   `-- drivers-hwmon-cros_ec_hwmon.c:warning:unused-variable-resp
|-- arm-allmodconfig
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:EC_AUTO_FAN_CONTROL_CMD_GET-undeclared-(first-use-in-this-function)
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:EC_AUTO_FAN_CONTROL_CMD_SET-undeclared-(first-use-in-this-function)
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:EC_CMD_PWM_GET_FAN_DUTY-undeclared-(first-use-in-this-function)
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:storage-size-of-req-isn-t-known
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:storage-size-of-resp-isn-t-known
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:struct-ec_params_auto_fan_ctrl_v2-has-no-member-named-cmd
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:struct-ec_params_auto_fan_ctrl_v2-has-no-member-named-fan_idx
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:struct-ec_params_pwm_get_fan_duty-has-no-member-named-fan_idx
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:variable-req-has-initializer-but-incomplete-type
|   |-- drivers-hwmon-cros_ec_hwmon.c:warning:excess-elements-in-struct-initializer
|   |-- drivers-hwmon-cros_ec_hwmon.c:warning:unused-variable-req
|   `-- drivers-hwmon-cros_ec_hwmon.c:warning:unused-variable-resp
|-- arm-allyesconfig
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:EC_AUTO_FAN_CONTROL_CMD_GET-undeclared-(first-use-in-this-function)
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:EC_AUTO_FAN_CONTROL_CMD_SET-undeclared-(first-use-in-this-function)
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:EC_CMD_PWM_GET_FAN_DUTY-undeclared-(first-use-in-this-function)
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:storage-size-of-req-isn-t-known
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:storage-size-of-resp-isn-t-known
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:struct-ec_params_auto_fan_ctrl_v2-has-no-member-named-cmd
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:struct-ec_params_auto_fan_ctrl_v2-has-no-member-named-fan_idx
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:struct-ec_params_pwm_get_fan_duty-has-no-member-named-fan_idx
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:variable-req-has-initializer-but-incomplete-type
|   |-- drivers-hwmon-cros_ec_hwmon.c:warning:excess-elements-in-struct-initializer
|   |-- drivers-hwmon-cros_ec_hwmon.c:warning:unused-variable-req
|   `-- drivers-hwmon-cros_ec_hwmon.c:warning:unused-variable-resp
|-- arm-randconfig-001-20250719
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:EC_AUTO_FAN_CONTROL_CMD_GET-undeclared-(first-use-in-this-function)
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:EC_AUTO_FAN_CONTROL_CMD_SET-undeclared-(first-use-in-this-function)
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:EC_CMD_PWM_GET_FAN_DUTY-undeclared-(first-use-in-this-function)
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:storage-size-of-req-isn-t-known
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:storage-size-of-resp-isn-t-known
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:struct-ec_params_auto_fan_ctrl_v2-has-no-member-named-cmd
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:struct-ec_params_auto_fan_ctrl_v2-has-no-member-named-fan_idx
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:struct-ec_params_pwm_get_fan_duty-has-no-member-named-fan_idx
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:variable-req-has-initializer-but-incomplete-type
|   |-- drivers-hwmon-cros_ec_hwmon.c:warning:control-reaches-end-of-non-void-function
|   |-- drivers-hwmon-cros_ec_hwmon.c:warning:excess-elements-in-struct-initializer
|   |-- drivers-hwmon-cros_ec_hwmon.c:warning:unused-variable-req
|   `-- drivers-hwmon-cros_ec_hwmon.c:warning:unused-variable-resp
|-- arm64-allmodconfig
|   `-- drivers-hwmon-cros_ec_hwmon.c:error:operand-of-type-void-where-arithmetic-or-pointer-type-is-required
|-- loongarch-allmodconfig
|   `-- drivers-hwmon-cros_ec_hwmon.c:error:operand-of-type-void-where-arithmetic-or-pointer-type-is-required
|-- m68k-allmodconfig
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:EC_AUTO_FAN_CONTROL_CMD_GET-undeclared-(first-use-in-this-function)
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:EC_AUTO_FAN_CONTROL_CMD_SET-undeclared-(first-use-in-this-function)
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:EC_CMD_PWM_GET_FAN_DUTY-undeclared-(first-use-in-this-function)
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:storage-size-of-req-isn-t-known
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:storage-size-of-resp-isn-t-known
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:struct-ec_params_auto_fan_ctrl_v2-has-no-member-named-cmd
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:struct-ec_params_auto_fan_ctrl_v2-has-no-member-named-fan_idx
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:struct-ec_params_pwm_get_fan_duty-has-no-member-named-fan_idx
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:variable-req-has-initializer-but-incomplete-type
|   |-- drivers-hwmon-cros_ec_hwmon.c:warning:excess-elements-in-struct-initializer
|   |-- drivers-hwmon-cros_ec_hwmon.c:warning:unused-variable-req
|   `-- drivers-hwmon-cros_ec_hwmon.c:warning:unused-variable-resp
|-- m68k-allyesconfig
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:EC_AUTO_FAN_CONTROL_CMD_GET-undeclared-(first-use-in-this-function)
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:EC_AUTO_FAN_CONTROL_CMD_SET-undeclared-(first-use-in-this-function)
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:EC_CMD_PWM_GET_FAN_DUTY-undeclared-(first-use-in-this-function)
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:storage-size-of-req-isn-t-known
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:storage-size-of-resp-isn-t-known
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:struct-ec_params_auto_fan_ctrl_v2-has-no-member-named-cmd
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:struct-ec_params_auto_fan_ctrl_v2-has-no-member-named-fan_idx
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:struct-ec_params_pwm_get_fan_duty-has-no-member-named-fan_idx
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:variable-req-has-initializer-but-incomplete-type
|   |-- drivers-hwmon-cros_ec_hwmon.c:warning:excess-elements-in-struct-initializer
|   |-- drivers-hwmon-cros_ec_hwmon.c:warning:unused-variable-req
|   `-- drivers-hwmon-cros_ec_hwmon.c:warning:unused-variable-resp
|-- microblaze-allmodconfig
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:EC_AUTO_FAN_CONTROL_CMD_GET-undeclared-(first-use-in-this-function)
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:EC_AUTO_FAN_CONTROL_CMD_SET-undeclared-(first-use-in-this-function)
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:EC_CMD_PWM_GET_FAN_DUTY-undeclared-(first-use-in-this-function)
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:storage-size-of-req-isn-t-known
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:storage-size-of-resp-isn-t-known
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:struct-ec_params_auto_fan_ctrl_v2-has-no-member-named-cmd
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:struct-ec_params_auto_fan_ctrl_v2-has-no-member-named-fan_idx
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:struct-ec_params_pwm_get_fan_duty-has-no-member-named-fan_idx
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:variable-req-has-initializer-but-incomplete-type
|   |-- drivers-hwmon-cros_ec_hwmon.c:warning:excess-elements-in-struct-initializer
|   |-- drivers-hwmon-cros_ec_hwmon.c:warning:unused-variable-req
|   `-- drivers-hwmon-cros_ec_hwmon.c:warning:unused-variable-resp
|-- microblaze-allyesconfig
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:EC_AUTO_FAN_CONTROL_CMD_GET-undeclared-(first-use-in-this-function)
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:EC_AUTO_FAN_CONTROL_CMD_SET-undeclared-(first-use-in-this-function)
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:EC_CMD_PWM_GET_FAN_DUTY-undeclared-(first-use-in-this-function)
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:storage-size-of-req-isn-t-known
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:storage-size-of-resp-isn-t-known
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:struct-ec_params_auto_fan_ctrl_v2-has-no-member-named-cmd
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:struct-ec_params_auto_fan_ctrl_v2-has-no-member-named-fan_idx
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:struct-ec_params_pwm_get_fan_duty-has-no-member-named-fan_idx
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:variable-req-has-initializer-but-incomplete-type
|   |-- drivers-hwmon-cros_ec_hwmon.c:warning:excess-elements-in-struct-initializer
|   |-- drivers-hwmon-cros_ec_hwmon.c:warning:unused-variable-req
|   `-- drivers-hwmon-cros_ec_hwmon.c:warning:unused-variable-resp
|-- s390-allmodconfig
|   `-- drivers-hwmon-cros_ec_hwmon.c:error:operand-of-type-void-where-arithmetic-or-pointer-type-is-required
|-- s390-allyesconfig
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:EC_AUTO_FAN_CONTROL_CMD_GET-undeclared-(first-use-in-this-function)
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:EC_AUTO_FAN_CONTROL_CMD_SET-undeclared-(first-use-in-this-function)
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:EC_CMD_PWM_GET_FAN_DUTY-undeclared-(first-use-in-this-function)
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:storage-size-of-req-isn-t-known
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:storage-size-of-resp-isn-t-known
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:struct-ec_params_auto_fan_ctrl_v2-has-no-member-named-cmd
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:struct-ec_params_auto_fan_ctrl_v2-has-no-member-named-fan_idx
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:struct-ec_params_pwm_get_fan_duty-has-no-member-named-fan_idx
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:variable-req-has-initializer-but-incomplete-type
|   |-- drivers-hwmon-cros_ec_hwmon.c:warning:excess-elements-in-struct-initializer
|   |-- drivers-hwmon-cros_ec_hwmon.c:warning:unused-variable-req
|   `-- drivers-hwmon-cros_ec_hwmon.c:warning:unused-variable-resp
|-- sh-allmodconfig
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:EC_AUTO_FAN_CONTROL_CMD_GET-undeclared-(first-use-in-this-function)
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:EC_AUTO_FAN_CONTROL_CMD_SET-undeclared-(first-use-in-this-function)
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:EC_CMD_PWM_GET_FAN_DUTY-undeclared-(first-use-in-this-function)
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:storage-size-of-req-isn-t-known
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:storage-size-of-resp-isn-t-known
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:struct-ec_params_auto_fan_ctrl_v2-has-no-member-named-cmd
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:struct-ec_params_auto_fan_ctrl_v2-has-no-member-named-fan_idx
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:struct-ec_params_pwm_get_fan_duty-has-no-member-named-fan_idx
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:variable-req-has-initializer-but-incomplete-type
|   |-- drivers-hwmon-cros_ec_hwmon.c:warning:excess-elements-in-struct-initializer
|   |-- drivers-hwmon-cros_ec_hwmon.c:warning:unused-variable-req
|   `-- drivers-hwmon-cros_ec_hwmon.c:warning:unused-variable-resp
|-- sh-allyesconfig
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:EC_AUTO_FAN_CONTROL_CMD_GET-undeclared-(first-use-in-this-function)
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:EC_AUTO_FAN_CONTROL_CMD_SET-undeclared-(first-use-in-this-function)
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:EC_CMD_PWM_GET_FAN_DUTY-undeclared-(first-use-in-this-function)
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:storage-size-of-req-isn-t-known
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:storage-size-of-resp-isn-t-known
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:struct-ec_params_auto_fan_ctrl_v2-has-no-member-named-cmd
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:struct-ec_params_auto_fan_ctrl_v2-has-no-member-named-fan_idx
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:struct-ec_params_pwm_get_fan_duty-has-no-member-named-fan_idx
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:variable-req-has-initializer-but-incomplete-type
|   |-- drivers-hwmon-cros_ec_hwmon.c:warning:excess-elements-in-struct-initializer
|   |-- drivers-hwmon-cros_ec_hwmon.c:warning:unused-variable-req
|   `-- drivers-hwmon-cros_ec_hwmon.c:warning:unused-variable-resp
|-- sparc-allmodconfig
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:EC_AUTO_FAN_CONTROL_CMD_GET-undeclared-(first-use-in-this-function)
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:EC_AUTO_FAN_CONTROL_CMD_SET-undeclared-(first-use-in-this-function)
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:EC_CMD_PWM_GET_FAN_DUTY-undeclared-(first-use-in-this-function)
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:storage-size-of-req-isn-t-known
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:storage-size-of-resp-isn-t-known
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:struct-ec_params_auto_fan_ctrl_v2-has-no-member-named-cmd
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:struct-ec_params_auto_fan_ctrl_v2-has-no-member-named-fan_idx
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:struct-ec_params_pwm_get_fan_duty-has-no-member-named-fan_idx
|   |-- drivers-hwmon-cros_ec_hwmon.c:error:variable-req-has-initializer-but-incomplete-type
|   |-- drivers-hwmon-cros_ec_hwmon.c:warning:excess-elements-in-struct-initializer
|   |-- drivers-hwmon-cros_ec_hwmon.c:warning:unused-variable-req
|   `-- drivers-hwmon-cros_ec_hwmon.c:warning:unused-variable-resp
`-- um-allyesconfig
    |-- drivers-hwmon-cros_ec_hwmon.c:error:EC_AUTO_FAN_CONTROL_CMD_GET-undeclared-(first-use-in-this-function)
    |-- drivers-hwmon-cros_ec_hwmon.c:error:EC_AUTO_FAN_CONTROL_CMD_SET-undeclared-(first-use-in-this-function)
    |-- drivers-hwmon-cros_ec_hwmon.c:error:EC_CMD_PWM_GET_FAN_DUTY-undeclared-(first-use-in-this-function)
    |-- drivers-hwmon-cros_ec_hwmon.c:error:storage-size-of-req-isn-t-known
    |-- drivers-hwmon-cros_ec_hwmon.c:error:storage-size-of-resp-isn-t-known
    |-- drivers-hwmon-cros_ec_hwmon.c:error:struct-ec_params_auto_fan_ctrl_v2-has-no-member-named-cmd
    |-- drivers-hwmon-cros_ec_hwmon.c:error:struct-ec_params_auto_fan_ctrl_v2-has-no-member-named-fan_idx
    |-- drivers-hwmon-cros_ec_hwmon.c:error:struct-ec_params_pwm_get_fan_duty-has-no-member-named-fan_idx
    |-- drivers-hwmon-cros_ec_hwmon.c:error:variable-req-has-initializer-but-incomplete-type
    |-- drivers-hwmon-cros_ec_hwmon.c:warning:control-reaches-end-of-non-void-function
    |-- drivers-hwmon-cros_ec_hwmon.c:warning:excess-elements-in-struct-initializer
    |-- drivers-hwmon-cros_ec_hwmon.c:warning:unused-variable-req
    `-- drivers-hwmon-cros_ec_hwmon.c:warning:unused-variable-resp

elapsed time: 1452m

configs tested: 108
configs skipped: 3

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                     haps_hs_smp_defconfig    gcc-15.1.0
arc                   randconfig-001-20250719    gcc-14.3.0
arc                   randconfig-002-20250719    gcc-15.1.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                   randconfig-001-20250719    gcc-14.3.0
arm                   randconfig-002-20250719    clang-21
arm                   randconfig-003-20250719    clang-21
arm                   randconfig-004-20250719    clang-16
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250719    clang-20
arm64                 randconfig-002-20250719    clang-18
arm64                 randconfig-003-20250719    gcc-15.1.0
arm64                 randconfig-004-20250719    clang-20
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250719    gcc-15.1.0
csky                  randconfig-002-20250719    gcc-11.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250719    clang-21
hexagon               randconfig-002-20250719    clang-21
i386        buildonly-randconfig-001-20250719    clang-20
i386        buildonly-randconfig-002-20250719    gcc-12
i386        buildonly-randconfig-003-20250719    gcc-12
i386        buildonly-randconfig-004-20250719    clang-20
i386        buildonly-randconfig-005-20250719    clang-20
i386        buildonly-randconfig-006-20250719    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-21
loongarch             randconfig-001-20250719    clang-18
loongarch             randconfig-002-20250719    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                        m5272c3_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                         db1xxx_defconfig    clang-21
mips                           ip22_defconfig    gcc-15.1.0
mips                           mtx1_defconfig    clang-21
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250719    gcc-11.5.0
nios2                 randconfig-002-20250719    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
parisc                           alldefconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250719    gcc-8.5.0
parisc                randconfig-002-20250719    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20250719    clang-19
powerpc               randconfig-002-20250719    gcc-10.5.0
powerpc               randconfig-003-20250719    gcc-12.5.0
powerpc                     stx_gp3_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250719    gcc-8.5.0
powerpc64             randconfig-002-20250719    clang-21
powerpc64             randconfig-003-20250719    gcc-10.5.0
riscv                             allnoconfig    gcc-15.1.0
riscv                 randconfig-001-20250719    clang-21
riscv                 randconfig-002-20250719    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250719    gcc-9.5.0
s390                  randconfig-002-20250719    gcc-9.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250719    gcc-13.4.0
sh                    randconfig-002-20250719    gcc-15.1.0
sh                           se7750_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250719    gcc-15.1.0
sparc                 randconfig-002-20250719    gcc-15.1.0
sparc64               randconfig-001-20250719    gcc-9.5.0
sparc64               randconfig-002-20250719    gcc-9.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250719    clang-16
um                    randconfig-002-20250719    clang-21
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20250719    clang-20
x86_64      buildonly-randconfig-002-20250719    clang-20
x86_64      buildonly-randconfig-003-20250719    clang-20
x86_64      buildonly-randconfig-004-20250719    gcc-12
x86_64      buildonly-randconfig-005-20250719    clang-20
x86_64      buildonly-randconfig-006-20250719    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250719    gcc-14.3.0
xtensa                randconfig-002-20250719    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
