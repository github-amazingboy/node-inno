var Minimize, CloseBtn: HWND; //close btn
	mainBg : Longint; //bg image

	htmlAdBar: HWND;
	adPage: TWizardPage;

//重新设置窗口样式
procedure initMainWindow();
begin
	//beautify window
	with WizardForm do begin
		ClientWidth:={{ui.clientWidth}};
		ClientHeight:={{ui.clientHeight}};
		Center;
		OnMouseDown:=@WizardFormMouseDown;
	end;

	InitFairy(WizardForm.Handle, 0, 20 );
	AddImgToList(-20, -20, 255, clNone, ExpandConstant('{tmp}\shadow.png'))
	ShowFairyEx(0);

	//window background
	mainBg:=ImgLoad(WizardForm.Handle, ExpandConstant('{tmp}\bg.png'), 0, 0, WizardForm.ClientWidth, WizardForm.ClientHeight, True, True);

	//minimize btn
	Minimize:=BtnCreate(WizardForm.Handle, {{ui.minimizeButton.left}}, {{ui.minimizeButton.top}}, {{ui.minimizeButton.width}}, {{ui.minimizeButton.height}}, ExpandConstant('{tmp}\minimizeBtn.png'), 3, False);
	BtnSetEvent(Minimize, BtnClickEventID, WrapBtnCallback(@MinimizeOnClick, 1));
	
	//close btn
	CloseBtn:=BtnCreate(WizardForm.Handle, {{ui.closeButton.left}}, {{ui.closeButton.top}}, {{ui.closeButton.width}}, {{ui.closeButton.height}}, ExpandConstant('{tmp}\closeBtn.png'), 3, False);
	BtnSetEvent(CloseBtn, BtnClickEventID, WrapBtnCallback(@CloseBtnOnClick, 1));

	ImgApplyChanges(WizardForm.Handle);
end;

procedure setEnableCloseBtn(isEnabled:Boolean);
begin
	BtnSetEnabled(CloseBtn, isEnabled);
end;