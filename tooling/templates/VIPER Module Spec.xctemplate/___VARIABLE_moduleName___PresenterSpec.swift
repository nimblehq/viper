//
//  ___FILENAME___
//  ___PROJECTNAME___ Tests
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Quick
import Nimble

@testable import ___PROJECTNAME___

final class ___VARIABLE_moduleName___PresenterSpec: QuickSpec {

    override func spec() {

        var presenter: ___VARIABLE_moduleName___Presenter!
        var router: ___VARIABLE_moduleName___RouterInputMock!
        var view: ___VARIABLE_moduleName___ViewInputMock!
        var output: ___VARIABLE_moduleName___OutputMock!

        describe("a ___VARIABLE_moduleName___ presenter") {

            beforeEach {
                router = ___VARIABLE_moduleName___RouterInputMock()
                view = ___VARIABLE_moduleName___ViewInputMock()
                presenter = ___VARIABLE_moduleName___Presenter(router: router)
                output = ___VARIABLE_moduleName___OutputMock()
                presenter.output = output
                presenter.view = view
            }

            context("when viewDidLoad is called") {

                beforeEach {
                    presenter.viewDidLoad()
                }

                it("calls view to configure view") {
                    expect(view.configureCalled) == true
                }
            }
        }
    }
}
